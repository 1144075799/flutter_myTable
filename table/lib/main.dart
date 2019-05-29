import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import './provide/isopen.dart';

void main() {
  var providers=Providers();
  var open=isOpenProvide();

  providers
  ..provide(Provider<isOpenProvide>.value(open));

  runApp(ProviderNode(child: MyApp(),providers: providers,));
}

/**
 * 垂直listView
 */
class MyApp extends StatelessWidget {

  bool isOpen=false;

  @override
  Widget build(BuildContext context) {
    final title = 'list';
    return new MaterialApp(
      title: title,
      home: Provide<isOpenProvide>(
        builder: (context,child,val){
          return new Scaffold(
            appBar: new AppBar(
              title: new Text(title),
            ),
            body: new Center(
              child: new ListView(
                //控制方向 默认是垂直的
              scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          _titleContext('操作'),
                          _titleContext('价格'),
                          _titleContext('数量'),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          _operation('+',context),
                          _context('100'),
                          _context('1000'),
                        ],
                      ),
                      _addTable(context),
                      Row(
                        children: <Widget>[
                          _titleContext('操作'),
                          _titleContext('价格'),
                          _titleContext('数量'),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          _operation('+',context),
                          _context('100'),
                          _context('1000'),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /**
   * 抽取item项
   */
   Widget _titleContext(String title){
    return Container(
      width: 150,
      margin: EdgeInsets.only(left: 10.0),
      child: Text(
        title,
        style: TextStyle(
          decoration: TextDecoration.underline
        ),
      ),
    );
  }

  Widget _addTable(BuildContext context){
    print('增加区域的${Provide.value<isOpenProvide>(context).isopen}');
    if (Provide.value<isOpenProvide>(context).isopen) {
      return _newList(context);
    } else{
      return Text('点击加载');
    }
  }
  
  Widget _operation(String title,BuildContext context){
    return Container(
      width: 150,
      margin: EdgeInsets.only(left: 10.0),
      child: InkWell(
        onTap: ()async{
         await Provide.value<isOpenProvide>(context).open();
         _addTable(context);
        },
        child: Text(
          title,
        ),
      )
    );
  }

  Widget _context(String title){
    return Container(
      width: 150,
      margin: EdgeInsets.only(left: 10.0),
      child: Text(
        title,
      ),
    );
  }

  Widget _newList(BuildContext context){
    return Row(
      children: <Widget>[
        Container(
          color: Colors.grey,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _titleContext('操作'),
                  _titleContext('价格'),
                  _titleContext('数量'),
                ],
              ),
              Row(
                children: <Widget>[
                  _operation('+',context),
                  _context('100'),
                  _context('1000'),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

}