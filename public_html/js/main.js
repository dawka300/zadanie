/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

let square = document.querySelector('#main');
square.addEventListener("mouseover", (e)=>{
   let square2 = document.querySelector('#square');
   //console.log(square.getBoundingClientRect());
   let position= square2.getBoundingClientRect();
//   console.log(position.bottom);
//   console.log(e.clientY);
    if (e.clientX<position.left && e.clientY>position.top && e.clientY<position.bottom) {
    square.style.left = e.clientX+5+"px";
    console.log("udało się 2");
   }else if (e.clientX>position.right && e.clientY<position.bottom && e.clientY>position.top) {
      square.style.left = e.clientX-85+"px";
//      console.log(position.left);
//   console.log(e.clientX);
   }else if (e.clientX>position.left && e.clientX<position.right && e.clientY>position.bottom) {
         square.style.top = e.clientY-85+"px";
      
   }else  if (e.clientX>position.left && e.clientX<position.right && e.clientY<position.top) {
        square.style.top = e.clientY+5+"px";
      
   }else if (e.clientX<position.left && e.clientY<position.top){
     square.style.left = e.clientX+5+"px";
     square.style.top = e.clientY+5+"px";
   }else if (e.clientX>position.right && e.clientY<position.top){
      square.style.left = e.clientX-85+"px";
     square.style.top = e.clientY+5+"px";
   }else  if (e.clientX>position.right && e.clientY>position.bottom) {
         square.style.top = e.clientY-85+"px";
         square.style.left = e.clientX-85+"px";
   }else  if (e.clientX<position.left && e.clientY>position.bottom) {
         square.style.top = e.clientY-85+"px";
         square.style.left = e.clientX+5+"px";
   }
   

   

   //square.style.right = e.clientY+"px";
   //square.style.left = e.clientX+"px";
  
//   document.addEventListener('mousemove', (e)=>{
//   square.style.left = e.clientX+"px";
//   });
 //  console.log(e.pageX);
  // console.log(position.x);
   
});
 /**
  * Comment
  */
//function rotate(element) {
//   
//}