import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: new MyHomePage(title: 'flutter_html Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

const htmlData = """
<h1>Header 1</h1>
<h2>Header 2</h2>
<h3>Header 3</h3>
<h4>Header 4</h4>
<h5>Header 5</h5>
<h6>Header 6</h6>
<h3>Ruby Support:</h3>
      <p>
        <ruby>
          漢<rt>かん</rt>
          字<rt>じ</rt>
        </ruby>
        &nbsp;is Japanese Kanji.
      </p>
      <h3>Support for <code>sub</code>/<code>sup</code></h3>
      Solve for <var>x<sub>n</sub></var>: log<sub>2</sub>(<var>x</var><sup>2</sup>+<var>n</var>) = 9<sup>3</sup>
      <p>One of the most <span>common</span> equations in all of physics is <br /><var>E</var>=<var>m</var><var>c</var><sup>2</sup>.</p>
      <h3>Inline Styles:</h3>
      <p>The should be <span style='color: blue;'>BLUE style='color: blue;'</span></p>
      <p>The should be <span style='color: red;'>RED style='color: red;'</span></p>
      <p>The should be <span style='color: rgba(0, 0, 0, 0.10);'>BLACK with 10% alpha style='color: rgba(0, 0, 0, 0.10);</span></p>
      <p>The should be <span style='color: rgb(0, 97, 0);'>GREEN style='color: rgb(0, 97, 0);</span></p>
      <p>The should be <span style='background-color: red; color: rgb(0, 97, 0);'>GREEN style='color: rgb(0, 97, 0);</span></p>
      <p style="text-align: center;"><span style="color: rgba(0, 0, 0, 0.95);">blasdafjklasdlkjfkl</span></p>
      <p style="text-align: right;"><span style="color: rgba(0, 0, 0, 0.95);">blasdafjklasdlkjfkl</span></p>
      <p style="text-align: justify;"><span style="color: rgba(0, 0, 0, 0.95);">blasdafjklasdlkjfkl</span></p>
      <p style="text-align: center;"><span style="color: rgba(0, 0, 0, 0.95);">blasdafjklasdlkjfkl</span></p>
      <h3>Table support (with custom styling!):</h3>
      <p>
      <q>Famous quote...</q>
      </p>
      <table>
      <colgroup>
        <col width="50%" />
        <col span="2" width="25%" />
      </colgroup>
      <thead>
      <tr><th>One</th><th>Two</th><th>Three</th></tr>
      </thead>
      <tbody>
      <tr>
        <td rowspan='2'>Rowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan</td><td>Data</td><td>Data</td>
      </tr>
      <tr>
        <td colspan="2"><img alt='Google' src='https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png' /></td>
      </tr>
      </tbody>
      <tfoot>
      <tr><td>fData</td><td>fData</td><td>fData</td></tr>
      </tfoot>
      </table>
      <h3>Custom Element Support (inline: <bird></bird> and as block):</h3>
      <flutter></flutter>
      <flutter horizontal></flutter>
      <h3>SVG support:</h3>
      <svg id='svg1' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'>
            <circle r="32" cx="35" cy="65" fill="#F00" opacity="0.5"/>
            <circle r="32" cx="65" cy="65" fill="#0F0" opacity="0.5"/>
            <circle r="32" cx="50" cy="35" fill="#00F" opacity="0.5"/>
      </svg>
      <h3>List support:</h3>
      <ol>
            <li>This</li>
            <li><p>is</p></li>
            <li>an</li>
            <li>
            ordered
            <ul>
            <li>With<br /><br />...</li>
            <li>a</li>
            <li>nested</li>
            <li>unordered
            <ol>
            <li>With a nested</li>
            <li>ordered list.</li>
            </ol>
            </li>
            <li>list</li>
            </ul>
            </li>
            <li>list! Lorem ipsum dolor sit amet.</li>
            <li><h2>Header 2</h2></li>
            <h2><li>Header 2</li></h2>
      </ol>
      <h3>Link support:</h3>
      <p>
        Linking to <a href='https://github.com'>websites</a> has never been easier.
      </p>
      <h3>Image support:</h3>
      <p>
        <img alt='Google' src='https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png' /><br />
        <a href='https://google.com'>A linked image: <img alt='Google' src='https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png' /></a>
        <img alt='Alt Text of an intentionally broken image' src='https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30d' />
      </p>
      <h3>Video support:</h3>
      <video controls>
        <source src="https://www.w3schools.com/html/mov_bbb.mp4" />
      </video>
      <h3>Audio support:</h3>
      <audio controls>
        <source src="https://www.w3schools.com/html/mov_bbb.mp4" />
      </audio>
      <h3>IFrame support:</h3>
      <iframe src="https://google.com"></iframe>
""";

final HTML = """
<html><head></head><body onload="parent.document.getElementById('lps/TEST/RENDERER/1612872414386_2').loadAds(window,false)" leftmargin="0" marginwidth="0" marginheight="0" style="background: transparent" topmargin="0"><p></p>
<!--[if gte mso 9]><xml><o:OfficeDocumentSettings><o:AllowPNG/><o:PixelsPerInch>96</o:PixelsPerInch></o:OfficeDocumentSettings></xml><![endif]--><!--[if !mso]><!--><!--<![endif]--><!--[if !mso]><!-->
<p></p>
<!--<![endif]-->
<style type="text/css">
		body {
			margin: 0;
			padding: 0;
		}

		table,
		td,
		tr {
			vertical-align: top;
			border-collapse: collapse;
		}

		* {
			line-height: inherit;
		}

		a[x-apple-data-detectors=true] {
			color: inherit !important;
			text-decoration: none !important;
		}
	</style>
<style id="media-query" type="text/css">
		@media (max-width: 620px) {

			.block-grid,
			.col {
				min-width: 320px !important;
				max-width: 100% !important;
				display: block !important;
			}

			.block-grid {
				width: 100% !important;
			}

			.col {
				width: 100% !important;
			}

			.col_cont {
				margin: 0 auto;
			}

			img.fullwidth,
			img.fullwidthOnMobile {
				max-width: 100% !important;
			}

			.no-stack .col {
				min-width: 0 !important;
				display: table-cell !important;
			}

			.no-stack.two-up .col {
				width: 50% !important;
			}

			.no-stack .col.num2 {
				width: 16.6% !important;
			}

			.no-stack .col.num3 {
				width: 25% !important;
			}

			.no-stack .col.num4 {
				width: 33% !important;
			}

			.no-stack .col.num5 {
				width: 41.6% !important;
			}

			.no-stack .col.num6 {
				width: 50% !important;
			}

			.no-stack .col.num7 {
				width: 58.3% !important;
			}

			.no-stack .col.num8 {
				width: 66.6% !important;
			}

			.no-stack .col.num9 {
				width: 75% !important;
			}

			.no-stack .col.num10 {
				width: 83.3% !important;
			}

			.video-block {
				max-width: none !important;
			}

			.mobile_hide {
				min-height: 0px;
				max-height: 0px;
				max-width: 0px;
				display: none;
				overflow: hidden;
				font-size: 0px;
			}

			.desktop_hide {
				display: block !important;
				max-height: none !important;
			}
		}
	</style>
<style id="icon-media-query" type="text/css">
		@media (max-width: 620px) {
			.icons-inner {
				text-align: center;
			}

			.icons-inner td {
				margin: 0 auto;
			}
		}
	</style>
<!--[if IE]><div class="ie-browser"><![endif]-->
<table bgcolor="#FFFFFF" cellpadding="0" cellspacing="0" class="nl-container" role="presentation" style="table-layout: fixed; vertical-align: top; min-width: 320px; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #ffffff; width: 100%;" valign="top" width="100%">
<tbody>
<tr style="vertical-align: top;" valign="top">
<td style="word-break: break-word; vertical-align: top;" valign="top"><!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color:#FFFFFF"><![endif]-->
<div style="background-color: transparent;">
<div class="block-grid" style="min-width: 320px; max-width: 600px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; margin: 0 auto; background-color: transparent;">
<div style="border-collapse: collapse; display: table; width: 100%; background-color: transparent;"><!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color:transparent;"><tr><td align="center"><table cellpadding="0" cellspacing="0" border="0" style="width:600px"><tr class="layout-full-width" style="background-color:transparent"><![endif]--> <!--[if (mso)|(IE)]><td align="center" width="600" style="background-color:transparent;width:600px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent;" valign="top"><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding-right: 0px; padding-left: 0px; padding-top:5px; padding-bottom:5px;"><![endif]-->
<div class="col num12" style="min-width: 320px; max-width: 600px; display: table-cell; vertical-align: top; width: 600px;">
<div class="col_cont" style="width: 100% !important;"><!--[if (!mso)&(!IE)]><!-->
<div style="border: 0px solid transparent; padding: 5px 0px 5px 0px;"><!--<![endif]-->
<div align="center" class="img-container center autowidth" style="padding-right: 0px; padding-left: 0px;"><!--[if mso]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr style="line-height:0px"><td style="padding-right: 0px;padding-left: 0px;" align="center"><![endif]--><a href="https://csr.onet.pl/1746213/clk/das,631303,285932?gctx=eJyFUE1LxDAQ_S-5ugszSdNte6sWpLi6ha178BKmn0S6raRdL-J_d1JF8aIwJO_Ny5uX5E0cRSKKw81TmYqNSJncp_k-f7hldswz5mdgmBeMJEj0BQq00mEUxToK4gi9fvpbL4p1FjUBVbrDjqod1IpqaEJSUsYhNdih9qH7Q-lTyQ527LmReecOQ5QbUbvW1NPY2f7iaLHTaF5bN_P-lb4FuYW4xDgB4LpaV54x2P9tWCIkwS_bxXXjz13Mi5saw6i1S3s2oUIFyn_aY5Zd8zH_zrvT3PbG0dj40d8NqphqtfKBnhdm8CnOw-p8_wAOiWjh&at=1612922735&uuid=613d9d015d143cfba3d5dd47424ecd08&URL=https%3A%2F%2Fwww.gaspol.pl%2Fogrzewanie-dla-domu%2Fw-czym-ci-pomoc%2Fprogram-czyste-powietrze%3Futm_source%3DOnet%26utm_medium%3DemailOnet%26utm_campaign%3D2021_pl_all_domestic_nierobdymu%26utm_content%3Dpaid--Onet-" style="outline: none;" target="_blank" rel="noopener" tabindex="-1"><img align="center" alt="Nie rób dymu!" border="0" class="center autowidth" src="http://webservice.buildingoffice.eu/DemoCrm//Company/Handlers/AttachmentsHandler.ashx?db=9&id=12341&version=1" style="text-decoration: none; -ms-interpolation-mode: bicubic; height: auto; border: 0; width: 100%; max-width: 600px; display: block;" title="Nie rób dymu!" width="600"></a> <!--[if mso]></td></tr></table><![endif]--></div>
<div align="center" class="img-container center autowidth" style="padding-right: 0px; padding-left: 0px;"><!--[if mso]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr style="line-height:0px"><td style="padding-right: 0px;padding-left: 0px;" align="center"><![endif]--><a href="https://csr.onet.pl/1746213/clk/das,631303,285932?gctx=eJyFUE1LxDAQ_S-5ugszSdNte6sWpLi6ha178BKmn0S6raRdL-J_d1JF8aIwJO_Ny5uX5E0cRSKKw81TmYqNSJncp_k-f7hldswz5mdgmBeMJEj0BQq00mEUxToK4gi9fvpbL4p1FjUBVbrDjqod1IpqaEJSUsYhNdih9qH7Q-lTyQ527LmReecOQ5QbUbvW1NPY2f7iaLHTaF5bN_P-lb4FuYW4xDgB4LpaV54x2P9tWCIkwS_bxXXjz13Mi5saw6i1S3s2oUIFyn_aY5Zd8zH_zrvT3PbG0dj40d8NqphqtfKBnhdm8CnOw-p8_wAOiWjh&at=1612922735&uuid=613d9d015d143cfba3d5dd47424ecd08&URL=https%3A%2F%2Fwww.gaspol.pl%2Fogrzewanie-dla-domu%2Fw-czym-ci-pomoc%2Fprogram-czyste-powietrze%3Futm_source%3DOnet%26utm_medium%3DemailOnet%26utm_campaign%3D2021_pl_all_domestic_nierobdymu%26utm_content%3Dpaid--Onet-" style="outline: none;" target="_blank" rel="noopener" tabindex="-1"><img align="center" alt="Zmień ogrzewanie domu na gaz płynny" border="0" class="center autowidth" src="http://webservice.buildingoffice.eu/DemoCrm//Company/Handlers/AttachmentsHandler.ashx?db=9&id=12342&version=1" style="text-decoration: none; -ms-interpolation-mode: bicubic; height: auto; border: 0; width: 100%; max-width: 600px; display: block;" title="Zmień ogrzewanie domu na gaz płynny" width="600"></a> <!--[if mso]></td></tr></table><![endif]--></div>
<div align="center" class="img-container center autowidth" style="padding-right: 0px; padding-left: 0px;"><!--[if mso]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr style="line-height:0px"><td style="padding-right: 0px;padding-left: 0px;" align="center"><![endif]--><a href="https://csr.onet.pl/1746213/clk/das,631303,285932?gctx=eJyFUE1LxDAQ_S-5ugszSdNte6sWpLi6ha178BKmn0S6raRdL-J_d1JF8aIwJO_Ny5uX5E0cRSKKw81TmYqNSJncp_k-f7hldswz5mdgmBeMJEj0BQq00mEUxToK4gi9fvpbL4p1FjUBVbrDjqod1IpqaEJSUsYhNdih9qH7Q-lTyQ527LmReecOQ5QbUbvW1NPY2f7iaLHTaF5bN_P-lb4FuYW4xDgB4LpaV54x2P9tWCIkwS_bxXXjz13Mi5saw6i1S3s2oUIFyn_aY5Zd8zH_zrvT3PbG0dj40d8NqphqtfKBnhdm8CnOw-p8_wAOiWjh&at=1612922735&uuid=613d9d015d143cfba3d5dd47424ecd08&URL=https%3A%2F%2Fwww.gaspol.pl%2Fogrzewanie-dla-domu%2Fw-czym-ci-pomoc%2Fprogram-czyste-powietrze%3Futm_source%3DOnet%26utm_medium%3DemailOnet%26utm_campaign%3D2021_pl_all_domestic_nierobdymu%26utm_content%3Dpaid--Onet-" style="outline: none;" target="_blank" rel="noopener" tabindex="-1"><img align="center" alt="Odbierz dofinansowanie do 20000 zł w ramach programu Czyste Powietrze" border="0" class="center autowidth" src="http://webservice.buildingoffice.eu/DemoCrm//Company/Handlers/AttachmentsHandler.ashx?db=9&id=12343&version=1" style="text-decoration: none; -ms-interpolation-mode: bicubic; height: auto; border: 0; width: 100%; max-width: 600px; display: block;" title="Odbierz dofinansowanie do 20000 zł w ramach programu Czyste Powietrze" width="600"></a> <!--[if mso]></td></tr></table><![endif]--></div>
<div align="center" class="img-container center autowidth" style="padding-right: 0px; padding-left: 0px;"><!--[if mso]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr style="line-height:0px"><td style="padding-right: 0px;padding-left: 0px;" align="center"><![endif]--><a href="https://csr.onet.pl/1746213/clk/das,631303,285932?gctx=eJyFUE1LxDAQ_S-5ugszSdNte6sWpLi6ha178BKmn0S6raRdL-J_d1JF8aIwJO_Ny5uX5E0cRSKKw81TmYqNSJncp_k-f7hldswz5mdgmBeMJEj0BQq00mEUxToK4gi9fvpbL4p1FjUBVbrDjqod1IpqaEJSUsYhNdih9qH7Q-lTyQ527LmReecOQ5QbUbvW1NPY2f7iaLHTaF5bN_P-lb4FuYW4xDgB4LpaV54x2P9tWCIkwS_bxXXjz13Mi5saw6i1S3s2oUIFyn_aY5Zd8zH_zrvT3PbG0dj40d8NqphqtfKBnhdm8CnOw-p8_wAOiWjh&at=1612922735&uuid=613d9d015d143cfba3d5dd47424ecd08&URL=https%3A%2F%2Fwww.gaspol.pl%2Fogrzewanie-dla-domu%2Fw-czym-ci-pomoc%2Fprogram-czyste-powietrze%3Futm_source%3DOnet%26utm_medium%3DemailOnet%26utm_campaign%3D2021_pl_all_domestic_nierobdymu%26utm_content%3Dpaid--Onet-" style="outline: none;" target="_blank" rel="noopener" tabindex="-1"><img align="center" alt="Ogrzewaj dom w sposób ekonomiczny i przyjazny środowisku! Wybierz instalacje na gaz płynny!" border="0" class="center autowidth" src="http://webservice.buildingoffice.eu/DemoCrm//Company/Handlers/AttachmentsHandler.ashx?db=9&id=12344&version=1" style="text-decoration: none; -ms-interpolation-mode: bicubic; height: auto; border: 0; width: 100%; max-width: 600px; display: block;" title="Ogrzewaj dom w sposób ekonomiczny i przyjazny środowisku! Wybierz instalacje na gaz płynny!" width="600"></a> <!--[if mso]></td></tr></table><![endif]--></div>
<div align="center" class="img-container center autowidth" style="padding-right: 0px; padding-left: 0px;"><!--[if mso]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr style="line-height:0px"><td style="padding-right: 0px;padding-left: 0px;" align="center"><![endif]--><a href="https://csr.onet.pl/1746213/clk/das,631303,285932?gctx=eJyFUE1LxDAQ_S-5ugszSdNte6sWpLi6ha178BKmn0S6raRdL-J_d1JF8aIwJO_Ny5uX5E0cRSKKw81TmYqNSJncp_k-f7hldswz5mdgmBeMJEj0BQq00mEUxToK4gi9fvpbL4p1FjUBVbrDjqod1IpqaEJSUsYhNdih9qH7Q-lTyQ527LmReecOQ5QbUbvW1NPY2f7iaLHTaF5bN_P-lb4FuYW4xDgB4LpaV54x2P9tWCIkwS_bxXXjz13Mi5saw6i1S3s2oUIFyn_aY5Zd8zH_zrvT3PbG0dj40d8NqphqtfKBnhdm8CnOw-p8_wAOiWjh&at=1612922735&uuid=613d9d015d143cfba3d5dd47424ecd08&URL=https%3A%2F%2Fwww.gaspol.pl%2Fogrzewanie-dla-domu%2Fw-czym-ci-pomoc%2Fprogram-czyste-powietrze%3Futm_source%3DOnet%26utm_medium%3DemailOnet%26utm_campaign%3D2021_pl_all_domestic_nierobdymu%26utm_content%3Dpaid--Onet-" style="outline: none;" target="_blank" rel="noopener" tabindex="-1"><img align="center" alt="Sprawdź ofertę GASPOLU!" border="0" class="center autowidth" src="http://webservice.buildingoffice.eu/DemoCrm//Company/Handlers/AttachmentsHandler.ashx?db=9&id=12345&version=1" style="text-decoration: none; -ms-interpolation-mode: bicubic; height: auto; border: 0; width: 100%; max-width: 600px; display: block;" title="Sprawdź ofertę GASPOLU!" width="600"></a> <!--[if mso]></td></tr></table><![endif]--></div>
<div align="center" class="img-container center autowidth" style="padding-right: 0px; padding-left: 0px;"><!--[if mso]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr style="line-height:0px"><td style="padding-right: 0px;padding-left: 0px;" align="center"><![endif]--><a href="https://csr.onet.pl/1746213/clk/das,631303,285932?gctx=eJyFUE1LxDAQ_S-5ugszSdNte6sWpLi6ha178BKmn0S6raRdL-J_d1JF8aIwJO_Ny5uX5E0cRSKKw81TmYqNSJncp_k-f7hldswz5mdgmBeMJEj0BQq00mEUxToK4gi9fvpbL4p1FjUBVbrDjqod1IpqaEJSUsYhNdih9qH7Q-lTyQ527LmReecOQ5QbUbvW1NPY2f7iaLHTaF5bN_P-lb4FuYW4xDgB4LpaV54x2P9tWCIkwS_bxXXjz13Mi5saw6i1S3s2oUIFyn_aY5Zd8zH_zrvT3PbG0dj40d8NqphqtfKBnhdm8CnOw-p8_wAOiWjh&at=1612922735&uuid=613d9d015d143cfba3d5dd47424ecd08&URL=https%3A%2F%2Fwww.gaspol.pl%2Fogrzewanie-dla-domu%2Fw-czym-ci-pomoc%2Fprogram-czyste-powietrze%3Futm_source%3DOnet%26utm_medium%3DemailOnet%26utm_campaign%3D2021_pl_all_domestic_nierobdymu%26utm_content%3Dpaid--Onet-" style="outline: none;" target="_blank" rel="noopener" tabindex="-1"><img align="center" alt="GASPOL - Lider dostaw gazu płynnego w Polsce!" border="0" class="center autowidth" src="http://webservice.buildingoffice.eu/DemoCrm//Company/Handlers/AttachmentsHandler.ashx?db=9&id=12346&version=1" style="text-decoration: none; -ms-interpolation-mode: bicubic; height: auto; border: 0; width: 100%; max-width: 600px; display: block;" title="GASPOL - Lider dostaw gazu płynnego w Polsce!" width="600"></a> <!--[if mso]></td></tr></table><![endif]--></div>
<!--[if (!mso)&(!IE)]><!--></div>
<!--<![endif]--></div>
</div>
<!--[if (mso)|(IE)]></td></tr></table><![endif]--> <!--[if (mso)|(IE)]></td></tr></table></td></tr></table><![endif]--></div>
</div>
</div>
<div style="background-color: transparent;">
<div class="block-grid" style="min-width: 320px; max-width: 600px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; margin: 0 auto; background-color: transparent;">
<div style="border-collapse: collapse; display: table; width: 100%; background-color: transparent;"><!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color:transparent;"><tr><td align="center"><table cellpadding="0" cellspacing="0" border="0" style="width:600px"><tr class="layout-full-width" style="background-color:transparent"><![endif]--> <!--[if (mso)|(IE)]><td align="center" width="600" style="background-color:transparent;width:600px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent;" valign="top"><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding-right: 0px; padding-left: 0px; padding-top:5px; padding-bottom:5px;"><![endif]-->
<div class="col num12" style="min-width: 320px; max-width: 600px; display: table-cell; vertical-align: top; width: 600px;">
<div class="col_cont" style="width: 100% !important;"><!--[if (!mso)&(!IE)]><!-->
<div style="border: 0px solid transparent; padding: 5px 0px 5px 0px;"><!--<![endif]-->
<table cellpadding="0" cellspacing="0" role="presentation" style="table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt;" valign="top" width="100%">
<tbody>
<tr style="vertical-align: top;" valign="top">
<td align="center" style="word-break: break-word; vertical-align: top; text-align: center; padding: 5px 0px 5px 0px;" valign="top"><!--[if vml]><table align="left" cellpadding="0" cellspacing="0" role="presentation" style="display:inline-block;padding-left:0px;padding-right:0px;mso-table-lspace: 0pt;mso-table-rspace: 0pt;"><![endif]--> <!--[if !vml]><!-->
<table cellpadding="0" cellspacing="0" class="icons-inner" role="presentation" style="table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; display: inline-block; margin-right: -4px; padding-left: 0px; padding-right: 0px;" valign="top"><!--<![endif]--></table>
</td>
</tr>
</tbody>
</table>
<!--[if (!mso)&(!IE)]><!--></div>
<!--<![endif]--></div>
</div>
<!--[if (mso)|(IE)]></td></tr></table><![endif]--> <!--[if (mso)|(IE)]></td></tr></table></td></tr></table><![endif]--></div>
</div>
</div>
<!--[if (mso)|(IE)]></td></tr></table><![endif]--></td>
</tr>
</tbody>
</table>
<!--[if (IE)]></div><![endif]--><p><span style="font-size: 9px;">Wiadomość przesłana przez Ringier Axel Springer Polska sp. z o.o. na zlecenie:</span></p>
<p><span style="font-size: 9px;">GASPOL S.A. | Al. Jana Pawła II 80 | 00-175 Warszawa</span><br><span style="font-size: 9px;">NIP: 779-00-20-583. Sąd Rejonowy dla m. st. Warszawy</span><br><span style="font-size: 9px;">XII Wydział Gospodarczy Krajowego Rejestru Sądowego KRS 0000021200</span><br><span style="font-size: 9px;">Kapitał zakładowy: 116 407 140,30 zł wpłacony w całości</span></p><p style="color: inherit; font-family: Verdana,Tahoma,Arial,Sans; font-size: 9px !important; line-height: 13px;">Niniejsza korespondencja nie wiąże się z udostępnieniem adresu e-mail użytkownika jakimkolwiek podmiotom trzecim. List został wysłany za zgodą użytkowników Onet Poczty i zgodnie z jej <a href="https://csr.onet.pl/1746213/clk/das,631303,285932?gctx=eJyFUE1LxDAQ_S-5ugszSdNte6sWpLi6ha178BKmn0S6raRdL-J_d1JF8aIwJO_Ny5uX5E0cRSKKw81TmYqNSJncp_k-f7hldswz5mdgmBeMJEj0BQq00mEUxToK4gi9fvpbL4p1FjUBVbrDjqod1IpqaEJSUsYhNdih9qH7Q-lTyQ527LmReecOQ5QbUbvW1NPY2f7iaLHTaF5bN_P-lb4FuYW4xDgB4LpaV54x2P9tWCIkwS_bxXXjz13Mi5saw6i1S3s2oUIFyn_aY5Zd8zH_zrvT3PbG0dj40d8NqphqtfKBnhdm8CnOw-p8_wAOiWjh&at=1612922735&uuid=613d9d015d143cfba3d5dd47424ecd08&URL=https%3A%2F%2Fpoczta.onet.pl%2FregulaminOnetPoczta.pdf" target="_blank" rel="noopener noreferrer">Regulaminem</a>. Szczegóły dotyczące mailingów reklamowych można sprawdzić w ustawieniach konta. W razie dodatkowych pytań prosimy o kontakt na adres: <a href="https://csr.onet.pl/1746213/clk/das,631303,285932?gctx=eJyFUE1LxDAQ_S-5ugszSdNte6sWpLi6ha178BKmn0S6raRdL-J_d1JF8aIwJO_Ny5uX5E0cRSKKw81TmYqNSJncp_k-f7hldswz5mdgmBeMJEj0BQq00mEUxToK4gi9fvpbL4p1FjUBVbrDjqod1IpqaEJSUsYhNdih9qH7Q-lTyQ527LmReecOQ5QbUbvW1NPY2f7iaLHTaF5bN_P-lb4FuYW4xDgB4LpaV54x2P9tWCIkwS_bxXXjz13Mi5saw6i1S3s2oUIFyn_aY5Zd8zH_zrvT3PbG0dj40d8NqphqtfKBnhdm8CnOw-p8_wAOiWjh&at=1612922735&uuid=613d9d015d143cfba3d5dd47424ecd08&URL=mailto%3Aabuse%40grupaonet.pl" target="_blank" rel="noopener noreferrer">abuse@onet.pl</a></p>
<p style="color: inherit; font-family: Verdana,Tahoma,Arial,Sans; font-size: 9px !important; line-height: 13px;">Weryfikacja listu: <a data-dnt="1" href="https://ad-verify.dreamlab.pl/1746213/index.html?auddb_id=1&adbeta=hbDI4NTkzMiFzbG90Lm1haWxpbmc%3D" target="_blank" rel="noopener noreferrer">link weryfikacyjny</a></p><img width="1" data-embed="0" height="1" border="0" style="width:1px !important;height:1px !important; border:0 !important" src="https://csr.onet.pl/eclk/das,631303,285932/IP=202102100305356889584981/IV=202102100305356889584981/AUDDB=1/NID=1746213/S=POCZTA/A=MAILING/SID=m0/AID=ad4ab5f1fab70c3ac0d6a32296ad1f15/open"></body></html>
""";

final HTML2 ="""
<html><head></head><body onload="parent.document.getElementById('lps/TEST/RENDERER/1612276139740_2').loadAds(window,false)" leftmargin="0" marginwidth="0" marginheight="0" style="background: transparent" topmargin="0"><p></p>
<center>
<table border="0" cellpadding="0" cellspacing="0" style="width: 100%; max-width: 600px; margin: 0px auto; background: #ededed; box-sizing: border-box;" align="center">
<tbody>
<tr>
<td colspan="2">
<table border="0" cellpadding="0" cellspacing="0" style="max-width: 500px; width: 100%; margin: 30px auto 10px; -webkit-box-shadow: 0px 0px 30px 0px rgba(50, 50, 50, 0.2); -moz-box-shadow: 0px 0px 30px 0px rgba(50, 50, 50, 0.2); box-shadow: 0px 0px 30px 0px rgba(50, 50, 50, 0.2); border-top: 5px solid #009ee2; border-bottom: 5px solid #009ee2;">
<tbody>
<tr style="background: #fff;">
<td colspan="1" valign="top" width="161" height="50" aria-label="" allign="left" style="background: #fff;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> <img src="http://webservice.buildingoffice.eu/DemoCrm//Company/Handlers/AttachmentsHandler.ashx?db=9&id=12349&version=1" style="border: 0; display: block; margin: 20px;" width="161" height="50"> </a></td>
<td colspan="1" valign="middle" style="background: #fff;">
<p style="margin: 0; margin-right: 20px; font-size: 14px; line-height: 25px; color: #084c97; font-family: Arial; text-align: right; font-weight: bold;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> <span style="font-weight: bold;">Dopłacamy do zaniżonych</span><br>odszkodowań - średnio <span style="color: #b1356c; font-weight: bold;">2711 zł*!</span> </a></p>
</td>
</tr>
<tr style="background: #fff; margin-left: 20px; margin-right: 20px; border-radius: 10px;">
<td colspan="2"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> <img src="http://webservice.buildingoffice.eu/DemoCrm//Company/Handlers/AttachmentsHandler.ashx?db=9&id=12350&version=1" style="border: 0; display: block; margin-left: 25px;" width="90%" height=""><br></a></td>
</tr>
<tr>
<td colspan="2" valign="top" width="100%" height="200" style="background: #fff;" align="middle">
<p style="margin: 10px; margin-top: 0px; margin-left: 25px; font-family: Arial; font-size: 20px; text-align: left; font-weight: bold; color: #084c97;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> Cześć! </a></p>
<p style="margin: 10px 10px 5px; font-family: Arial; font-size: 13px; text-align: left; color: #084c97; line-height: 22px; margin-left: 25px;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> Piszę do Ciebie w PILNEJ sprawie, która dotyczy Twojego auta. Chodzi o odszkodowanie, jakie zostało Ci wypłacone z OC sprawcy po ostatniej kolizji. </a></p>
<p style="margin: 25px 25px 10px 25px; font-family: Arial; font-size: 12px; text-align: left; color: #084c97; line-height: 20px;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> Z naszych badań wynika, że aż <strong><u>99% odszkodowań wypłaconych kierowcom jest zaniżonych</u></strong>. Dlatego moja firma prowadzi ogólnopolską akcję weryfikacji odszkodowań wypłaconych po wypadkach i kolizjach, czyli sytuacjach gdy inny kierowca wjechał w tył Twojego auta, wymusił pierwszeństwo, uszkodził Ci auto na parkingu itp. </a></p>
<p style="margin: 25px 20px 15px 25px; font-family: Arial; font-size: 12px; text-align: left; color: #084c97; font-weight: bold;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> Prawie wszyscy kierowcy otrzymują zbyt niskie odszkodowania, ponieważ: </a></p>
<div style="margin-top: 5px; width: 90%; text-align: left;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> <img src="http://webservice.buildingoffice.eu/DemoCrm//Company/Handlers/AttachmentsHandler.ashx?db=9&id=12351&version=1" style="display: inline-block; width: 19px; height: auto;" alt="icon"> </a>
<p style="display: inline-block; margin: 0px; margin-left: 5px; font-family: Arial; font-size: 12px; color: #084c97; vertical-align: middle; width: 90%; line-height: 20px;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> ubezpieczyciele stosują w kosztorysie naprawy pojazdu części zamienne zamiast oryginalnych (!), </a></p>
</div>
<div style="margin-top: 5px; width: 90%; text-align: left;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> <img src="http://webservice.buildingoffice.eu/DemoCrm//Company/Handlers/AttachmentsHandler.ashx?db=9&id=12352&version=1" style="display: inline-block; width: 19px; height: auto;" alt="icon"> </a>
<p style="display: inline-block; margin: 0px; margin-left: 5px; font-family: Arial; font-size: 12px; color: #084c97; vertical-align: super; width: 90%;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> dodatkowo obniżają koszty materiałów lakierniczych, </a></p>
</div>
<div style="margin-top: 5px; width: 90%; text-align: left;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> <img src="http://webservice.buildingoffice.eu/DemoCrm//Company/Handlers/AttachmentsHandler.ashx?db=9&id=12353&version=1" style="display: inline-block; width: 19px; height: auto;" alt="icon"> </a>
<p style="display: inline-block; margin: 0px; margin-left: 5px; font-family: Arial; font-size: 12px; color: #084c97; vertical-align: super; width: 90%;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> prawie zawsze zaniżają koszty pracy blacharza i lakiernika, </a></p>
</div>
<div style="margin-top: 5px; width: 90%; text-align: left;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> <img src="http://webservice.buildingoffice.eu/DemoCrm//Company/Handlers/AttachmentsHandler.ashx?db=9&id=12354&version=1" style="display: inline-block; width: 19px; height: auto;" alt="icon"> </a>
<p style="display: inline-block; margin: 0px; margin-left: 5px; font-family: Arial; font-size: 12px; color: #084c97; vertical-align: super; width: 90%;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> stosują nieuzasadnione rabaty i amortyzację. </a></p>
</div>
<p style="margin: 10px; margin-top: 20px; margin-left: 25px; font-family: Arial; font-size: 20px; text-align: left; font-weight: bold; color: #084c97;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> Fakty! </a></p>
<div style="margin-top: 5px; width: 90%; text-align: left; margin-bottom: 5px;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> <img src="http://webservice.buildingoffice.eu/DemoCrm//Company/Handlers/AttachmentsHandler.ashx?db=9&id=12355&version=1" style="display: inline-block; width: 19px; height: auto;" alt="icon"> </a>
<p style="display: inline-block; margin: 0px; margin-left: 5px; font-family: Arial; font-size: 12px; color: #084c97; vertical-align: super; font-weight: bold;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> Średnia wysokość zaniżenia wynosi 2711 zł. </a></p>
</div>
<div style="margin-top: 5px; width: 90%; text-align: left; margin-bottom: 5px;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> <img src="http://webservice.buildingoffice.eu/DemoCrm//Company/Handlers/AttachmentsHandler.ashx?db=9&id=12356&version=1" style="display: inline-block; width: 19px; height: auto;" alt="icon"> </a>
<p style="display: inline-block; margin: 0px; margin-left: 5px; font-family: Arial; font-size: 12px; color: #084c97; vertical-align: super; font-weight: bold;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> Przelew na koncie możesz mieć już w kilka dni. </a></p>
</div>
<div style="margin-top: 5px; width: 90%; text-align: left; margin-bottom: 5px;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> <img src="http://webservice.buildingoffice.eu/DemoCrm//Company/Handlers/AttachmentsHandler.ashx?db=9&id=12357&version=1" style="display: inline-block; width: 19px; height: auto;" alt="icon"> </a>
<p style="display: inline-block; margin: 0px; margin-left: 5px; font-family: Arial; font-size: 12px; color: #084c97; vertical-align: super; font-weight: bold;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> Weryfikacja wysokości odszkodowania jest BEZPŁATNA. </a></p>
</div>
<p style="margin: 15px auto; padding: 15px 30px; font-family: Arial; font-size: 16px; display: inline-block; text-align: center; color: #fff; background: #e30250; font-weight: bold; border-radius: 7px;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> Odbierz dopłatę do szkody z OC </a></p>
<p style="margin: 10px; margin-left: 25px; font-family: Arial; font-size: 18px; text-align: left; font-weight: bold; color: #084c97; margin-top: 10px;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> Banalnie prosta droga do otrzymania dopłaty: </a></p>
<div style="margin-top: 5px; width: 90%; text-align: left; margin-bottom: 5px;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> <img src="http://webservice.buildingoffice.eu/DemoCrm//Company/Handlers/AttachmentsHandler.ashx?db=9&id=12358&version=1" style="display: inline-block; width: 19px; height: auto;" alt="icon"> </a>
<p style="display: inline-block; margin: 0px; margin-left: 5px; font-family: Arial; font-size: 12px; color: #084c97; vertical-align: super; font-weight: bold; margin-top: 5px;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> Wypełniasz formularz korzystając z <u>tego linku</u>. </a></p>
</div>
<div style="margin-top: 5px; width: 90%; text-align: left; margin-bottom: 5px;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> <img src="http://webservice.buildingoffice.eu/DemoCrm//Company/Handlers/AttachmentsHandler.ashx?db=9&id=12359&version=1" style="display: inline-block; width: 19px; height: auto;" alt="icon"> </a>
<p style="display: inline-block; margin: 0px; margin-left: 5px; font-family: Arial; font-size: 12px; color: #084c97; vertical-align: super; font-weight: bold;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> Wysyłasz nam do analizy dokumenty jakie masz od ubezpieczyciela. </a></p>
</div>
<div style="margin-top: 5px; width: 90%; text-align: left; margin-bottom: 5px;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> <img src="http://webservice.buildingoffice.eu/DemoCrm//Company/Handlers/AttachmentsHandler.ashx?db=9&id=12360&version=1" style="display: inline-block; width: 19px; height: auto;" alt="icon"> </a>
<p style="display: inline-block; margin: 0px; margin-left: 5px; font-family: Arial; font-size: 12px; color: #084c97; vertical-align: super; font-weight: bold;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> W ciągu 24 h otrzymujesz informację, jaka dopłata Ci się należy. </a></p>
</div>
<div style="margin-top: 5px; width: 90%; text-align: left; margin-bottom: 5px;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> <img src="http://webservice.buildingoffice.eu/DemoCrm//Company/Handlers/AttachmentsHandler.ashx?db=9&id=12361&version=1" style="display: inline-block; width: 19px; height: auto;" alt="icon"> </a>
<p style="display: inline-block; margin: 0px; margin-left: 5px; font-family: Arial; font-size: 12px; color: #084c97; vertical-align: super; font-weight: bold;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> Odbierasz przelew. </a>&gt;</p>
</div>
<table style="width: 100%; max-width: 90%; text-align: center; background: #f5f5f5; height: 150px;">
<tbody>
<tr>
<td colspan="3"><br>
<p style="display: inline-block; margin: 0px; margin-left: 5px; font-family: Arial; font-size: 11px; color: #084c97; vertical-align: super; font-weight: bold;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> Zobacz opinie zadowolonych klientów, którzy odzyskali nadpłacone prowizje: </a></p>
</td>
</tr>
<tr style="margin-bottom: 20px;">
<td align="middle"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> <img src="http://webservice.buildingoffice.eu/DemoCrm//Company/Handlers/AttachmentsHandler.ashx?db=9&id=12362&version=1" alt="" width="95px"> </a></td>
<td align="middle"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> <img src="http://webservice.buildingoffice.eu/DemoCrm//Company/Handlers/AttachmentsHandler.ashx?db=9&id=12363&version=1" alt="" width="95px"> </a></td>
<td align="middle"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> <img src="http://webservice.buildingoffice.eu/DemoCrm//Company/Handlers/AttachmentsHandler.ashx?db=9&id=12364&version=1" alt="" width="95px"> </a></td>
</tr>
</tbody>
</table>
<p style="margin: 20px auto 30px; font-family: Arial; font-size: 11px; text-align: center; color: #b3b3b3; line-height: 18px; max-width: 450px;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> <strong>*Kwota 2711 zł zł stanowi średnią wartość zaniżeń</strong> w kosztorysach naprawy pojazdu <br>przeanalizowanych przez Helpfind Sp. z o.o. w okresie od 1.09.2020 do 30.11.2020 roku. </a></p>
</td>
</tr>
</tbody>
</table>
<p style="margin: 10px auto 30px; font-family: Arial; font-size: 10px; text-align: center; color: #b3b3b3; line-height: 13px; max-width: 450px;"><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Flp.helpfind.pl%2Fanaliza-kosztorysu%3Futm_source%3Donet" target="_blank" style="text-decoration: none;" rel="noopener"> Marka Helpfind należy do firmy Helpfind Sp. z o.o. z siedzibą w Ostrowie Wielkopolskim <br>przy ul. Kazimierza Pułaskiego 11, wpisaną do rejestru przedsiębiorców KRS w Sądzie Rejonowym <br>Poznań – Nowe Miasto i Wilda w Poznaniu (IX Wydział Gospodarczy Krajowego Rejestru Sądowego) <br>pod numerem 0000385405, NIP 6222763569, REGON 301735830 </a></p>
</td>
</tr>
</tbody>
</table>
</center><p class="footer-mailing" style="color: inherit; font-family: Verdana,Tahoma,Arial,Sans; font-size: 9px !important; line-height: 13px;">Wiadomość przesłana przez Ringier Axel Springer Polska sp. z o.o. na zlecenie:<br>Helpfind Sp. z o.o.<br>63-400 Ostrów Wielkopolski<br>ul. <span>Kazimierza Pułaskiego 11</span><br><a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=mailto%3Aodszkodowania%40helpfind.pl">odszkodowania@helpfind.pl</a><br>tel. 616 350 050</p><p style="color: inherit; font-family: Verdana,Tahoma,Arial,Sans; font-size: 9px !important; line-height: 13px;">Niniejsza korespondencja nie wiąże się z udostępnieniem adresu e-mail użytkownika jakimkolwiek podmiotom trzecim. List został wysłany za zgodą użytkowników Onet Poczty i zgodnie z jej <a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=https%3A%2F%2Fpoczta.onet.pl%2FregulaminOnetPoczta.pdf" target="_blank" rel="noopener noreferrer">Regulaminem</a>. Szczegóły dotyczące mailingów reklamowych można sprawdzić w ustawieniach konta. W razie dodatkowych pytań prosimy o kontakt na adres: <a href="https://csr.onet.pl/1746213/clk/das,631231,286247?gctx=eJyFjc1qwzAQhN9F1yawK0sy8s2toZikjSFuDrmY9S8qjgN2mkvou3flhEIuCQhpvhnN7kVsRSSyzds-j8VCxAwfcbpOP9-ZtmnCfACWacZKgkR_wEKolAIdWq2NMj7fPc6zbJ5FtaJSt9hSGUIVUAW1oUBKa6jGFrVfut7kfiu53g0dG4lvhmgQFqIam6I6Dq3rfkY6ueNQnJtx4ve2fQlyCZiDjbSOAF4A-OYZvXtekzmqSN7V4q8keeU_yHq1m5quGGmo2dD236HSczBzT98nJriGUz9Xf_8A6JdcMw&at=1612944464&uuid=5fa0fca83873353aa906e5e84d9652b7&URL=mailto%3Aabuse%40grupaonet.pl" target="_blank" rel="noopener noreferrer">abuse@onet.pl</a></p>
<p style="color: inherit; font-family: Verdana,Tahoma,Arial,Sans; font-size: 9px !important; line-height: 13px;">Weryfikacja listu: <a data-dnt="1" href="https://ad-verify.dreamlab.pl/1746213/index.html?auddb_id=1&adbeta=hbDI4NjI0NyFzbG90Lm1haWxpbmc%3D" target="_blank" rel="noopener noreferrer">link weryfikacyjny</a></p><img width="1" data-embed="0" height="1" border="0" src="https://csr.onet.pl/eclk/das,631231,286247/IP=202102100907444057955646/IV=202102100907444057955646/AUDDB=1/NID=1746213/S=POCZTA/A=MAILING/SID=m0/AID=ad4ab5f1fab70c3ac0d6a32296ad1f15/open"></body></html>""";
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('flutter_html Example'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Html(
          data: HTML2,
          //Optional parameters:
          style: {
            "html": Style(
              backgroundColor: Colors.black12,
//              color: Colors.white,
            ),
//            "h1": Style(
//              textAlign: TextAlign.center,
//            ),
            "table": Style(
              backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
            ),
            "tr": Style(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            "th": Style(
              padding: EdgeInsets.all(6),
              backgroundColor: Colors.grey,
            ),
            "td": Style(
              padding: EdgeInsets.all(6),
              alignment: Alignment.topLeft,
            ),
            "var": Style(fontFamily: 'serif'),
          },
          customRender: {
            "bird": (RenderContext context, Widget child, attributes, _) {
              return TextSpan(text: "🐦");
            },
            "flutter": (RenderContext context, Widget child, attributes, _) {
              return FlutterLogo(
                style: (attributes['horizontal'] != null)
                    ? FlutterLogoStyle.horizontal
                    : FlutterLogoStyle.markOnly,
                textColor: context.style.color,
                size: context.style.fontSize.size * 5,
              );
            },
          },
          onLinkTap: (url) {
            print("Opening $url...");
          },
          onImageTap: (src) {
            print(src);
          },
          onImageError: (exception, stackTrace) {
            print(exception);
          },
        ),
      ),
    );
  }
}
