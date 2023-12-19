org 100h
jmp start			
;=============================
mode	db	18		
colour	db	2	
a_x	dw	412	  
a_y	dw	400	
b_x	dw	196
b_y	dw	400
c_x	dw	61
c_y	dw	346
d_x	dw	112
d_y	dw	278
e_x	dw	304
e_y	dw	254  
f_x     dw  	496
f_y 	dw  	278
g_x 	dw  	547
g_y 	dw  	346  
e2_x	dw	304
e2_y	dw	82  

start:
 mov ah,00
 mov al,mode			
 int 10h			
 mov ah,0Ch		        
 mov al,colour	    
 mov cx,a_x			
 mov dx,a_y			

draw_a_b:			
 int 10h
 sub cx, 2
 cmp cx,b_x
 jnz draw_a_b

prep_b_c:			
 mov cx,b_x
 mov dx,b_y
draw_b_c:			
 int 10h
 sub cx,5
 sub dx,2
 cmp cx,c_x
 jnz draw_b_c

prep_c_d:			
 mov cx,c_x
 mov dx,c_y
draw_c_d:			
 int 10h
 add cx,3
 sub dx,4
 cmp cx,d_x
 jnz draw_c_d
 
prep_d_e:			
 mov cx,d_x
 mov dx,d_y
draw_d_e:			
 int 10h
 add cx, 8
 sub dx, 1
 cmp cx,e_x
 jnz draw_d_e

prep_e_f:			   
 mov cx,e_x
 mov dx,e_y
draw_e_f:			
 int 10h
 add cx,8 
 add dx,1
 cmp cx,f_x
 jnz draw_e_f

prep_f_g:			     
 mov cx,f_x
 mov dx,f_y
draw_f_g:
 int 10h
 add cx,3
 add dx,4
 cmp cx,g_x
 jnz draw_f_g  

prep_g_a:			      
 mov cx,g_x
 mov dx,g_y
draw_g_a:
 int 10h
 sub cx,5
 add dx,2
 cmp cx,a_x
 jnz draw_g_a    
;===========================
prep_a_e2:			    
 mov cx,a_x
 mov dx,a_y
draw_a_e2:
 int 10h
 sub cx,1
 sub dx,3
 cmp cx,e2_x
 jnz draw_a_e2    

prep_b_e2:			     
mov cx,b_x
mov dx,b_y
draw_b_e2:
int 10h
add cx,1
sub dx,3
cmp cx,e2_x
jnz draw_b_e2 

prep_c_e2:			    
mov cx,c_x
mov dx,c_y
draw_c_e2:
int 10h
add cx,3
sub dx,15/4
cmp cx,e2_x
jnz draw_c_e2
      
prep_g_e2:			     
mov cx,g_x
mov dx,g_y
draw_g_e2:
int 10h
sub cx,3
sub dx,15/4
cmp cx,e2_x
jnz draw_g_e2    


prep_d_e2:			     
mov cx,d_x
mov dx,d_y
draw_d_e2:
 int 10h
 add cx,4
 sub dx,23/5
 cmp cx,e2_x    
 jnz draw_d_e2           
 
prep_f_e2:			     
mov cx,f_x
mov dx,f_y
draw_f_e2:
 int 10h
 sub cx,4
 sub dx,23/5
 cmp cx,e2_x  
 jnz draw_f_e2     


prep_e_e2:			     
mov cx,e_x
mov dx,e_y 
mov si,e2_y
sub si, 2
draw_e_e2:
 int 10h
 sub dx,6
 cmp dx,si 
 jnz draw_e_e2 
  
GetKey:
 mov ah,00
 int 16h
end:
 mov ah,00
 mov al,03
 int 10h
 mov ah,04Ch
 mov al,00
 int 21h
    ret