package cn.edu.scu.dms.controller;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.geom.Line2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.edu.scu.dms.services.AccountServices;
import cn.edu.scu.dms.model.User;
@Controller
public class AccountController {
	
	@Autowired
	AccountServices accountServices;
	  
	@RequestMapping(value="/Register.do",method=RequestMethod.POST)
	public  String registerControl(HttpServletRequest request,HttpServletResponse response){
		
		//查看验证码
		System.out.println("注册");
		String checkcode=request.getParameter("checkCode"); 
		if(checkcode.equals("")||checkcode==null){  
        	request.setAttribute("flag", "codeNull");
            return "Register";
        }else{  
            if(!checkcode.equalsIgnoreCase((String)request.getSession().getAttribute("randCheckCode"))){  
            	request.setAttribute("flag", "codeError");
                return "Register";
            }
        } 
            
		String name=request.getParameter("name");
		String pwd=request.getParameter("password");
		User temp = new User();
		temp.setAccount(name);
		temp.setPassword(pwd);
		temp.setPower(0);
		int returnResult=accountServices.insertUser(temp);
	    if(returnResult==0){
	    	
	    	request.setAttribute("flag", "namexist");
	    	return "Register";
	
	    }else{
	    	
	        return  "Main";
	    }    
	}
	
	@RequestMapping(value="/Login.do",method=RequestMethod.GET)
	public  String loginControl(HttpServletRequest request,HttpServletResponse response) {
        
		String name =request.getParameter("name");
		String password=request.getParameter("password");
		
	    System.out.println(name+" "+password);
		User temp=new User();
		temp.setAccount(name);
		temp.setPassword(password);
		
		User selectUser=accountServices.getUser(temp.getAccount());
		
		//System.out.println(selectUser.getAccount()+" "+selectUser.getPassword());
		if(selectUser!=null){
			if(temp.getPassword().equals(selectUser.getPassword())){
				return "Main";
			}else{
				request.setAttribute("success","false");
				return "Login";
			}	
		}else{
			request.setAttribute("success","false");
			return "Login";
		}
	}

	@RequestMapping(value="/getImage.do")
	public void getImageCode(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		
		System.out.println("验证码");
		//设置不缓存图片
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "No-cache");
		response.setDateHeader("Expires", 0);
		//指定生成的响应图片,一定不能缺少这句话,否则错误.
		response.setContentType("image/jpeg");
		int width=100,height=30;		//指定生成验证码的宽度和高度
		BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);	//创建BufferedImage对象,其作用相当于一图片
		Graphics g=image.getGraphics();		//创建Graphics对象,其作用相当于画笔
		Graphics2D g2d=(Graphics2D)g;		//创建Grapchics2D对象
		Random random=new Random();
		Font mfont=new Font("楷体",Font.BOLD,25);	//定义字体样式
		g.setColor(getRandColor(200,250));
		g.fillRect(0, 0, width, height);	//绘制背景
		g.setFont(mfont);					//设置字体
		g.setColor(getRandColor(180,200));
		
		//绘制100条颜色和位置全部为随机产生的线条,该线条为2f
		for(int i=0;i<100;i++){
			int x=random.nextInt(width-1);
			int y=random.nextInt(height-1);
			int x1=random.nextInt(6)+1;
			int y1=random.nextInt(12)+1;
			BasicStroke bs=new BasicStroke(2f,BasicStroke.CAP_BUTT,BasicStroke.JOIN_BEVEL);	//定制线条样式
			Line2D line=new Line2D.Double(x,y,x+x1,y+y1);
			g2d.setStroke(bs);
			g2d.draw(line);		//绘制直线
		}
		//输出由英文，数字，和中文随机组成的验证文字，具体的组合方式根据生成随机数确定。
		String sRand="";
		String ctmp="";
		int itmp=0;
		//制定输出的验证码为四位
		for(int i=0;i<4;i++){
			switch(random.nextInt(3)){
				case 1:		//生成A-Z的字母
				     itmp=random.nextInt(26)+65;
				     ctmp=String.valueOf((char)itmp);
				     break;
				default:
					 itmp=random.nextInt(10)+48;
					 ctmp=String.valueOf((char)itmp);
					 break;
			}
			sRand+=ctmp;
			Color color=new Color(20+random.nextInt(110),20+random.nextInt(110),random.nextInt(110));
			g.setColor(color);
			//将生成的随机数进行随机缩放并旋转制定角度 PS.建议不要对文字进行缩放与旋转,因为这样图片可能不正常显示
			/*将文字旋转指定角度*/
			Graphics2D g2d_word=(Graphics2D)g;
			AffineTransform trans=new AffineTransform();
			trans.rotate((30)*3.14/180,15*i+8,7);
			/*缩放文字*/
			float scaleSize=random.nextFloat()+0.8f;
			if(scaleSize>1f) scaleSize=1f;
			trans.scale(scaleSize, scaleSize);
			g2d_word.setTransform(trans);
			g.drawString(ctmp, 15*i+18, 14);
		}
		HttpSession session=request.getSession(true);
		session.setAttribute("randCheckCode", sRand);
		g.dispose();	//释放g所占用的系统资源
		ImageIO.write(image,"JPEG",response.getOutputStream());	//输出图片
	}
	
	
	/*该方法主要作用是获得随机生成的颜色*/ 
	public Color getRandColor(int s,int e){
		Random random=new Random ();
		if(s>255) s=255;
		if(e>255) e=255;
		int r,g,b;
		r=s+random.nextInt(e-s);	//随机生成RGB颜色中的r值
		g=s+random.nextInt(e-s);	//随机生成RGB颜色中的g值
		b=s+random.nextInt(e-s);	//随机生成RGB颜色中的b值
		return new Color(r,g,b);
	}

}