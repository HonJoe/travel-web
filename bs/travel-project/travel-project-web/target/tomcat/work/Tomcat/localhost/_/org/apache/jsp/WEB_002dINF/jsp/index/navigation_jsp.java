/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2019-08-31 14:25:58 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.index;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class navigation_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <title></title>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"/css/bootstrap.min.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"/css/index.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"/css/login.css\">\r\n");
      out.write("\r\n");
      out.write("    <link href=\"/images/rabbit_in_the_hat_128px_1199655_easyicon.net.ico\" rel=\"icon\" >\r\n");
      out.write("    <script type=\"text/javascript\" src=\"/js/jquery-3.1.1.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"/js/bootstrap.min.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"/js/index.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"/js/external.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<style>\r\n");
      out.write("    a:hover{\r\n");
      out.write("        text-decoration:none;\r\n");
      out.write("    }\r\n");
      out.write("</style>\r\n");
      out.write("<script>\r\n");
      out.write("    function openUrl() {\r\n");
      out.write("        window.open(\"http://wpa.qq.com/msgrd?v=3&uin=852276920&site=qq&menu=yes\",\"_blank\");\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("<!--导航栏-->\r\n");
      out.write("<div id=\"head\" class=\"row\">\r\n");
      out.write("    <div class=\"col-md-offset-1 col-xs-offset-1 col-md-1 col-xs-1 logo\"><img src=\"/images/rabbit_in_the_hat_573px_1199655_easyicon.net.png\" style=\"height: 45px;width: auto\"></div>\r\n");
      out.write("    <div class=\"col-md-6 col-xs-6 navigation\">\r\n");
      out.write("        <ul>\r\n");
      out.write("            <li class=\"navigation_item nav_item1\">\r\n");
      out.write("                <a class=\"option_bottom\" href=\"http://localhost:8080/indexView\">首页</a>\r\n");
      out.write("            </li>\r\n");
      out.write("            <li class=\"navigation_item nav_item2\"><a class=\"navigation_style\" href=\"http://localhost:8080/plistView\">旅游产品</a></li>\r\n");
      out.write("            <li class=\"navigation_item nav_item3\"><a class=\"navigation_style\" href=\"http://localhost:8080/customized\">服务定制</a></li>\r\n");
      out.write("            <li class=\"navigation_item nav_item4\"><a href=\"javascript:void(0);\" class=\"navigation_style\"   onclick=\"openUrl()\">咨询</a></li>\r\n");
      out.write("        </ul>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"col-md-2 col-xs-2 share\">\r\n");
      out.write("\r\n");
      out.write("        ");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("        ");
      if (_jspx_meth_c_005fif_005f1(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("    <!--登录框-->\r\n");
      out.write("    <div class=\"modal\" id=\"myModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\"\r\n");
      out.write("         style=\"z-index: 10000\">\r\n");
      out.write("        <div class=\"modal-dialog\" >\r\n");
      out.write("            <div class=\"modal-content\" >\r\n");
      out.write("                <div class=\"modal-header\">\r\n");
      out.write("                    <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">\r\n");
      out.write("                        <span>&times;</span>\r\n");
      out.write("                    </button>\r\n");
      out.write("                    <h4 class=\"modal-title\" id=\"myModalLabel\">登录</h4>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"modal-body\" >\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <input type=\"text\" class=\"form-control\" id=\"username\" placeholder=\"请输入用户名\">\r\n");
      out.write("                        <div class=\"messagebox\">\r\n");
      out.write("                            <span></span>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <input type=\"password\" class=\"form-control\" id=\"password\" placeholder=\"请输入密码\">\r\n");
      out.write("                        <div class=\"messagebox\">\r\n");
      out.write("                            <span></span>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"fpsd\">\r\n");
      out.write("                        <a href=\"#\">忘记密码</a>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("    $(function valid(){\r\n");
      out.write("        $('#password').keydown(function(event) {\r\n");
      out.write("            if (event.keyCode == 13) {\r\n");
      out.write("                var username = $(\"#username\").val();//取值\r\n");
      out.write("                var password = $(\"#password\").val();\r\n");
      out.write("                if(!username){\r\n");
      out.write("                    alert(\"用户名必填!\");\r\n");
      out.write("                    $(\"#username\").focus();//获取焦点\r\n");
      out.write("                    return false;\r\n");
      out.write("                }\r\n");
      out.write("                if(!password){\r\n");
      out.write("                    alert(\"密码必填!\");\r\n");
      out.write("                    $(\"#password\").focus();//获取焦点\r\n");
      out.write("                    return false;\r\n");
      out.write("                }\r\n");
      out.write("                //var param = \"username=\"+username+\"&password=\"+password;\r\n");
      out.write("                var param = {\"username\":username,\"password\":password};\r\n");
      out.write("                console.log(param);\r\n");
      out.write("                $.post(\"http://localhost:8080/user/login\",param,function(result){\r\n");
      out.write("                    if(result.status==200){\r\n");
      out.write("                        $(\"#myModal\").modal(\"hide\");\r\n");
      out.write("                        alert(\"登录成功\");\r\n");
      out.write("                        window.location.href=\"http://localhost:8080/indexView\";\r\n");
      out.write("\r\n");
      out.write("                    }else{\r\n");
      out.write("                        alert(\"用户名或密码错误\");\r\n");
      out.write("                    }\r\n");
      out.write("\r\n");
      out.write("                });\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("    });\r\n");
      out.write("</script>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f0.setParent(null);
    // /WEB-INF/jsp/index/navigation.jsp(43,8) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ sessionScope.currentUser==null }", java.lang.Boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
    if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("            <span class=\"login\">登录</span>\r\n");
        out.write("            <span class=\"reg\"><a href=\"http://localhost:8080/register\">注册</a> </span>\r\n");
        out.write("        ");
        int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f1.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f1.setParent(null);
    // /WEB-INF/jsp/index/navigation.jsp(47,8) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ sessionScope.currentUser!=null }", java.lang.Boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f1 = _jspx_th_c_005fif_005f1.doStartTag();
    if (_jspx_eval_c_005fif_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("            <span class=\"reg\"><a href=\"http://localhost:8080/user/updateView\">个人中心</a></span>\r\n");
        out.write("        ");
        int evalDoAfterBody = _jspx_th_c_005fif_005f1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f1);
    return false;
  }
}
