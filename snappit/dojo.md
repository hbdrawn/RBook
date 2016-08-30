dojo 笔录
1. dojo的架构：package->language libraries->environment libraries->application support->widget toolkit

1)dojo.addClass(node: DomNode|String , classStr: String )
添加某class到节点，
var node=dojo.byId('divv');
dojo.addClass('divv', 'color');
dojo.addClass(node, 's1');
 
2)var bool = dojo.hasClass(node: DomNode|String , classStr: String )  
 
3)var bool = dojo.removeClass(node: DomNode|String , classStr: String )
Removes the specified classes from node.
 
4)dojo.toggleClass(node: DomNode|String , classStr: String , condition: Boolean? )
添加或移除某节点的class,可以传入condition强制开或关class属性
 
5)dojo.style(node: DomNode|String , style: Object? , value: String? )
可传入2个或3个参数，可设定或读取style
dojo.style(‘node’, ‘color’);           //get
dojo.style(‘node’, {color: ‘red’})     //set
dojo.style(‘node’, ‘color’, ‘red’); //set
 
6)批量处理style，NodeList功能
dojo.query('div').style({color:'blue'});
dojo.query('div').addClass(‘className’);
dojo.query('div').removeClass(‘className’);
dojo.query('div').toggleClass(‘className’);