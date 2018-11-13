<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dynamicURL" value="${pageContext.request.contextPath }"></c:set>

<!--main-->
<div class="wrap mt10">
  <div class="tc"><img src="${dynamicURL }/frontresources/images/step.png"></div>
  <div class="clearfix">
    <!--img-->
    <div class="img loans-img bdr fl">
      <div class="lj indent">ico</div>
      <img src="${dynamicURL }/frontresources/images/img6.jpg">
    </div>
    <div class="formbox bdr fr">
      <table class="productForm">
        <tr>
          <th>居住城市</th>
          <td>
            <div class="citySelect">
              <dl id="js_city">
                <dt><i></i><span class="sp">请选择</span></dt>
                <dd style="display:none;"></dd>
              </dl>
            </div>
            <div class="tishi"><span id="cityError" class="prompt_2 hidden"></span></div>
          </td>
        </tr>
        <tr>
          <th>真实姓名</th>
          <td>
          	<label class="touzi01">
              <input type="text" id="realName" name="realName" class="input_all input_1" maxlength="15"/>
              <span>请输入真实姓名</span>
            </label>
            <div class="tishi"><span id="realNameError" class="prompt_2 hidden"></span></div>
          </td>
        </tr>
        <tr>
          <th>移动电话</th>
          <td>
            <label class="touzi01">
              <input type="text" id="mobile" name="mobile" class="input_all input_1" maxlength="11"/>
              <span>请输入11位手机号</span>
            </label>
            <div class="tishi"><span id="mobileError" class="prompt_2 hidden"></span></div>
          </td>
        </tr>
        <tr>
          <th>称谓</th>
          <td class="hight">
            <label><input name="gender" type="radio" value="0" checked>先生</label>
            <label><input name="gender" type="radio" value ="1">女士</label>
          </td>
        </tr>
        <tr>
          <th>出生日期</th>
          <td>
            <label class="touzi01">
              <input type="text" readonly id="birthday" name="birthday" class="input_all i_time input_1" style="z-index:1000;position:relative; width:227px"/>
              <span>yyyy-mm-dd</span>
            </label>
            <div class="tishi"><span id="birthdayError" class="prompt_2 hidden"></span></div>
          </td>
        </tr>
        <tr>
          <th>借款金额</th>
          <td>
            <label class="touzi01">
              <input type="text" id="loanAmount" name="amount" class="input_all i_yuan input_1" maxlength="7"/>
              <span>3万-30万</span>
            </label>
            <div class="tishi"><span id="amountError" class="prompt_2 hidden"></span></div>
          </td>
        </tr>
        <tr>
          <th>借款期限</th>
          <td>
            <select id="js_dueId" name="dueId" class="select1">
              <option value="1272947783684640">12个月</option>
              <option value="1272947783684641">18个月</option>
              <option value="1272947783684642">24个月</option>
            </select>
            <div class="tishi"></div>
          </td>
        </tr>
        <tr>
          <th>月均收入</th>
          <td>
            <label class="touzi01">
              <input type="text" id="income" name="income" class="input_all i_yuan input_1" maxlength="9"/>
              <span>请填写月收入金额</span>
            </label>
            <div class="tishi"><span id="incomeError" class="prompt_2 hidden"></span></div>
          </td>
        </tr>
        <tr>
          <th></th>
          <td><input type="button" id="save" value="立即申请" class="btn btnSize_6 btn_orange" /></td>
        </tr>
      </table>
    </div>
  </div>
  
  <div class="detailsBox mt20 clearfix">
    <div class="item first">
       <div class="title">申请资格</div>
       <ul class=" mt10 cicle">
         <li>年龄23周岁-60周岁的中国大陆公民（港、澳、台除外）</li>
         <li>企业或商户经营时间满1年及以上</li>
         <li>企业或商户月均流水须3万以上</li>
       </ul>
    </div>
    <div class="item">
       <div class="title">额度期限</div>
       <ul class=" mt10 cicle">
         <li>借款额度：3万-30万元</li>
         <li>借款期限：12、18、24个月</li>
         <li>还款方式：等额本息，每月还款</li>
       </ul>
    </div>
    <div class="item bd0">
       <div class="title">所需材料</div>
       <ul class=" mt10 cicle">
         <li>申请人二代身份证</li>
         <li>企业/商户经营场所证明材料</li>
         <li>近6个月对公或对私银行流水或POS交易流水</li>
       </ul>
    </div>
  </div>
</div>

<script src="${root }/webjsp/js/jquery.js"></script>
<script src="${root }/webjsp/js/Action.js"></script>
<script src="${root }/webjsp/js/waste.js"></script>
<script src="${root }/webjsp/js/banner.js"></script>
<script src="${root }/webjsp/js/jQuery-jcMarquee.js"></script>



<script type="text/javascript" src="${root }/webjsp/js/VisitorAPI-1.2.1-min.js"></script>
<script type="text/javascript" src="${root }/webjsp/js/AppMeasurement-1.2.1-min.js"></script>

<!--时间  s-->
<script type="text/javascript" src="${root }/webjsp/js/jquery.ui.datepicker.js"></script>
 
<script type="text/javascript" src="${root }/webjsp/js/jquery-ui.min.js"></script>
<!--时间  e
<script language="javascript">
		var staticCss = 'http://static.niwodai.com/Public/Static/201404';
		var cssVersion = '2015010618';
		var staticUrl = 'http://static.niwodai.com/';
</script> -->
<script src="${root }/webjsp/js/loanApplyValidate.js?v=2015010618.js" type="text/javascript"></script>
<script src="${root }/webjsp/js/detail.js?v=2015010618.js" type="text/javascript"></script>
<script src="${root }/webjsp/js/netCredit.js?v=2015010618.js" type="text/javascript"></script>
<script src="${root }/webjsp/js/loanApplyCitys.js?v=2015010618.js" type="text/javascript"></script>

<script>
$(function(){
	//--输入框内提示-------------
	$(".touzi01 .input_1").each(function(){
		 var thisVal=$(this).val();
		 if(thisVal!=""){
		   $(this).siblings("span").hide();
		  }else{
		   $(this).siblings("span").show();
		  }
		 $(this).focus(function(){
		   $(this).siblings("span").hide();
		  }).blur(function(){
			var val=$(this).val();
			if(val!=""){
			 $(this).siblings("span").hide();
			}else{
			 $(this).siblings("span").show();
			} 
		  });
		});
})
</script>
