/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var spanLargura = document.getElementById('largura');
var spanAltura = document.getElementById('altura');
window.onload = function(){
window.onresize = function (){
    altura =  window.innerHeight;
    largura = window.innerWidth;
    
    spanLargura.innerHTML = largura + 'px ';
    spanAltura.innerHTML = altura + 'px ';
};
};
