<%-- 
    Document   : index
    Created on : Dec 7, 2010, 11:06:18 AM
    Author     : mamg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>
        <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
        <script type="text/javascript" src="resources/jquery/js/jquery.corner.js"></script>
        <script type="text/javascript" src="resources/jquery/js/easySlider1.5.js"></script>
        <link href="resources/style.css" rel="stylesheet" type="text/css" />
        <title>Sistema De Evaluacion De Competitividad</title>
        <script type="text/javascript">
        $(document).ready(function(){	
	$("#slider").easySlider({
		controlsBefore:	'<p id="controls">',
		controlsAfter:	'</p>',
		auto: true, 
		continuous: true
	});	
});
// ]]>
</script>
<style type="text/css">
.gallery { width:890px; height:355px; margin:0 auto; }
#slider { margin:0; padding:0; list-style:none; }
#slider ul,
#slider li { margin:0; padding:0; list-style:none; }
/* 
    define width and height of list item (slide)
    entire slider area will adjust according to the parameters provided here
*/
#slider li { width:890px; height:355px; overflow:hidden; }
p#controls { margin:0; padding:0; position:relative; }
#prevBtn { display:block; margin:0; overflow:hidden; width:25px; height:48px; position:absolute; left:-41px; top:-230px; }
#nextBtn { display:block; margin:0; overflow:hidden; width:25px; height:48px; position:absolute; left: 906px; top:-230px; }
#prevBtn a { display:block; width:25px; height:48px; background:url(images/l_arrow.gif) no-repeat 0 0; }
#nextBtn a { display:block; width:25px; height:48px; background:url(images/r_arrow.gif) no-repeat 0 0; }
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <a href="logger.jsp"><img src="images/sing_up.gif" alt="picture" width="116" height="34" border="0" class="sing" /></a>
      <div class="menu">
        <ul>
          <li><a href="index.jsp" class="active"><span>Inicio</span></a></li>
          <li><a href="acerca_de.jsp"><span>Acerca de</span></a></li>          
          <li><a href="contacto.jsp"><span>Contactenos</span></a></li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="logo"><img src="images/logo.gif" width="293" height="84" border="0" /></div>
      <div class="search">
        <form id="form1" name="form1" method="post" action="">
          <label> <span>
            <input name="q" type="text" class="keywords" id="textfield" maxlength="50" value="Search..." />
            </span>
            <input name="b" type="image" src="images/search.gif" class="button" />
          </label>
        </form>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="header_text">
    <div class="header_text_resize">
      <div class="gallery">
        <div id="slider">
          <ul>
            <li>
              <div class="div"> <img src="images/simple_img_1.jpg" alt="screen 1" width="569" height="339" border="0" class="screen"  />
                <div class="left1">
                  <h2>Our Latest Project 1</h2>
                  <p>Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. </p>
                  <br />
                  <br />
                  <a href="#"><img src="images/more_inform_up.gif" alt="picture" width="133" height="30" border="0" class="button" /></a></div>
              </div>
            </li>
            <li>
              <div class="div"><img src="images/simple_img_2.jpg" alt="screen 1" width="569" height="339" border="0" class="screen"  />
                <div class="left1">
                  <h2>Our Latest Project 2</h2>
                  <p>Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. </p>
                  <br />
                  <br />
                  <a href="#"><img src="images/more_inform_up.gif" alt="picture" width="133" height="30" border="0" class="button" /></a></div>
              </div>
            </li>
            <li>
              <div class="div"><img src="images/simple_img_3.jpg" alt="screen 1" width="569" height="339" border="0" class="screen"  />
                <div class="left1">
                  <h2>Our Latest Project 3</h2>
                  <p>Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. </p>
                  <br />
                  <br />
                  <a href="#"><img src="images/more_inform_up.gif" alt="picture" width="133" height="30" border="0" class="button" /></a></div>
              </div>
            </li>
          </ul>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="clr"></div>
  <div class="body">
    <div class="body_resize">
      <div class="right">
        <div class="clr"></div>
        <div class="right_top">
          <div class="right_bottom">
            <h4>Sub Heading 1</h4>
            <img src="images/img_1.jpg" alt="picture" width="92" height="92" class="float" />
            <p><strong>Fusce vehicula dignissim ligula. </strong><br />
              Vestibulum sit amet neque eu neque suscipit consequat quis vel risus. <br />
              Vestibulum vehicula purus nec dui </p>
            <p><a href="#"><strong>Read More</strong></a></p>
            <div class="clr"></div>
          </div>
        </div>
        <div class="clr"></div>
      </div>
      <div class="right">
        <div class="clr"></div>
        <div class="right_top">
          <div class="right_bottom">
            <h4>Sub Heading 2</h4>
            <img src="images/img_2.jpg" alt="picture" width="92" height="92" class="float" />
            <p><strong>Fusce vehicula dignissim ligula. </strong><br />
              Vestibulum sit amet neque eu neque suscipit consequat quis vel risus. <br />
              Vestibulum vehicula purus nec dui </p>
            <p><a href="#"><strong>Read More</strong></a></p>
            <div class="clr"></div>
          </div>
        </div>
        <div class="clr"></div>
      </div>
      <div class="right">
        <div class="right_top">
          <div class="right_bottom">
            <h4>Sub Heading 3</h4>
            <img src="images/img_3.jpg" alt="picture" width="92" height="92" class="float" />
            <p><strong>Fusce vehicula dignissim ligula. </strong><br />
              Vestibulum sit amet neque eu neque suscipit consequat quis vel risus. <br />
              Vestibulum vehicula purus nec dui </p>
            <p><a href="#"><strong>Read More</strong></a></p>
            <div class="clr"></div>
          </div>
        </div>
        <div class="clr"></div>
      </div>
      <div class="right1">
        <h2>Welcome to Expert Business</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. <br />
          Vestibulum eget bibendum tellus.</p>
        <p><img src="images/img_4.jpg" alt="picture" width="293" /></p>
        <p><strong>Nunc vel imperdiet tellus. Mauris ornare aliquam urna, accumsan bibendum eros auctor ac. </strong></p>
        <p>Suspendisse adipiscing rhoncus massa, sit amet sollicitudin quam vulputate non. In non turpis nisl. Curabitur purus mi, pharetra vitae viverra et, mattis sit amet nunc. </p>
      </div>
      <div class="right1">
        <h2>Services</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. <br />
          Vestibulum eget bibendum tellus. </p>
        <ul>
          <li>Sed congue, dui vel tristique mollis.</li>
          <li>Morbi eget sem. Nam mollis. </li>
          <li>Donec sed velit ut tellus fermentum interdum.</li>
          <li>Etiam a odio in neque egestas consequat. </li>
          <li>Pellentesque posuere, orci id interdum.</li>
          <li>Vivamus sollicitudin.        </li>
        </ul>
        <p><a href="#"><img src="images/more_serv.gif" alt="picture" width="89" height="24" border="0" /></a></p>
      </div>
      <div class="right1">
        <h2>News &amp; Events</h2>
        <p><a href="#"><strong>14 / April / 09</strong></a><br />
          Listuem Names ligula a blandit ornare, ligula <br />
          a quis bibendum.<a href="#"> &gt;&gt;</a></p>
        <div class="line"></div>
        <p><a href="#"><strong>14 / April / 09</strong></a><br />
          Listuem Names ligula a blandit ornare, ligula <br />
          a quis bibendum.<a href="#"> &gt;&gt;</a></p>
        <div class="line"></div>
        <p><a href="#"><strong>14 / April / 09</strong></a><br />
          Listuem Names ligula a blandit ornare, ligula <br />
          a quis bibendum.<a href="#"> &gt;&gt;</a></p>
        <div class="line"></div>
        <p><a href="#"><img src="images/more_news.gif" alt="picture" width="89" height="24" border="0" /></a></p>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <ul>
        <li><a href="index.html">home</a></li>
        <li><a href="services.html">services</a></li>
        <li><a href="portfolio.html">portfolio</a></li>
        <li><a href="services.html">about</a></li>
        <li><a href="contact.html">contact</a></li>
        <li><a href="portfolio.html">rss feed</a></li>
      </ul>
      <p>Copyright © Sitename.com. <a href="http://dreamtemplate.com/">dreamtemplate.com</a>. All Rights Reserved</p>
      <div class="clr"></div>
    </div>
  </div>
  <div class="clr"></div>
</div>
</body>
</html>