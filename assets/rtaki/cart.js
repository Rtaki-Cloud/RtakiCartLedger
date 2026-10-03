/* 由锐泷云开发 · 主题定制与适配 | 官网：https://www.rtaki.com/ | QQ：1614074517 | 邮箱：support@rtaki.com | 文件：cart.js */
(function(){
  'use strict';
  function ready(){
    document.querySelectorAll('.rtaki-product-description').forEach(function(description){
      if(description.querySelector('a,img,table,video,iframe,button,input,style,script'))return;
      var copy=description.cloneNode(true);
      copy.querySelectorAll('br').forEach(function(node){node.replaceWith('\n');});
      copy.querySelectorAll('p,div,li').forEach(function(node){node.appendChild(document.createTextNode('\n'));});
      var lines=copy.textContent.trim().split(/\r?\n/).map(function(line){return line.trim();}).filter(Boolean);
      var isSpec=function(line){return /^[^:：]{1,24}[:：].+/.test(line);};
      var specs=lines.filter(isSpec),notes=lines.filter(function(line){return !isSpec(line);});
      if(specs.length<3||notes.length>3)return;
      var list=document.createElement('dl');list.className='rtaki-spec-list';
      specs.forEach(function(line){var parts=line.match(/^([^:：]+)[:：](.*)$/),row=document.createElement('div'),label=document.createElement('dt'),value=document.createElement('dd');label.textContent=parts[1].trim().replace(/\s+/g,'');value.textContent=parts[2].trim();row.append(label,value);list.appendChild(row);});
      var extra=document.createElement('div');extra.className='rtaki-product-notes';
      notes.forEach(function(line){var matching=Array.from(description.querySelectorAll('p,div,li')).find(function(node){return node.textContent.trim()===line;});var note=matching?matching.cloneNode(true):document.createElement('p');if(!matching)note.textContent=line;extra.appendChild(note);});
      description.replaceChildren(list);if(notes.length)description.appendChild(extra);description.classList.add('rtaki-description-specs');
    });
    document.querySelectorAll('.rtaki-categories a.is-active').forEach(function(link){link.setAttribute('aria-current','page');});
  }
  if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',ready);else ready();
})();
