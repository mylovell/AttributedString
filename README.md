# AttributedString
简单介绍了图文混排的三种：
  1. NSAttributedString：ios 6.0开始，用于三种控件：UILabel、UITextField、UITextView，其中UITextView可以有链接点击。
  2. UIWebView: 加载HTML就可以实现图文混排了，也可以有链接点击
    * 注意UIWebView有内存泄露哦，占用内存也较大
  3. TextKit：ios7开始，功能强，也就意味着学起来要花蛮多时间，可以实现文字环绕图片
  
还有 core Text ，ios6.0之前的，纯C，就算了，
