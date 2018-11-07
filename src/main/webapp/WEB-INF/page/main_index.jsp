<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dynamicURL" value="${pageContext.request.contextPath }"></c:set>

<!--banner-->
<div class="banner">
    <div id="inner">
        <div class="hot-event">
            <div class="switch-nav">
                <a href="#" onClick="return false;" class="prev">
                    <i class="ico i-prev"></i>
                    <span class="hide-clip">上一个</span>
                </a>
                <a href="#" onClick="return false;" class="next">
                    <i class="ico i-next"></i>
                    <span class="hide-clip">下一个</span>
                </a>
            </div>
            <div class="event-item" style="background-color:#c20000; background-image:url(${dynamicURL}/folder/upload/img4.jpg);">
                <a href="index.html" title="十七金融"></a>
            </div>
            <div class="event-item" style="background-color:#c20000; background-image:url(${dynamicURL}/folder/upload/img4.jpg);">
                <a href="index.html" title="十七金融"></a>
            </div>
            <div class="event-item" style="background-color:#c20000; background-image:url(${dynamicURL}/folder/upload/img4.jpg);">
                <a href="index.html" title="十七金融"></a>
            </div>
            <div class="switch-tab"></div>
            <div class="regbox">
                <h2>预期年化收益率</h2>
                <h1>12<span>%</span> -14<span>%</span></h1>
                <a href="javascript:;" class="button btn-reg regbtn">免费注册</a>
                <p class=" mt10 tr"><a href="javascript:;" class="button btn-login loginbtn">马上登录</a></p>
            </div>
        </div>
    </div>
</div>

<!--Platform-data-->
<div class="Platform-data">
    <div class="hd">
        <div class="wrap clearfix">
            <div class="title fl">平台数据<em class="gt indent">三角形</em></div>
            <div class="data fr">
                <div class="item"><span class="count">9,999,999</span>人实现借款</div>
                <div class="item"><span class="count">9,999,999</span>人成功投资</div>
                <div class="item"><span class="count">9,999,999</span>笔成功投资</div>
                <div class="item"><span class="count">9,999,999</span>万元成交金额</div>
            </div>
        </div>
    </div>
    <div class="wrap bd clearfix">
        <div class="item">
            <div class="ico-data data1 indent">高收益灵活投资</div>
            <b class="f14">高收益灵活投资</b><br>50元起投<br>预期12%-14%年化收益率<br>投资90天后即可债权转让
        </div>
        <div class="item">
            <div class="ico-data data2 indent">一站式借款服务</div>
            <b class="f14">一站式借款服务</b><br>无抵押信用贷款<br>24小时放款<br>提前还款可减免服务费
        </div>
        <div class="item">
            <div class="ico-data data3 indent">全方位安全保障</div>
            <b class="f14">全方位安全保障</b><br>5道安全防线<br>100%本金保障计划<br>专业的第三方资金托管
        </div>
        <div class="item">
            <div class="ico-data data4 indent">万国实力</div>
            <b class="f14">万国实力</b><br>十一家子公司<br>小额贷款公司<br>担保公司
        </div>
    </div>
</div>

<!--main-->
<div class="wrap mt10 clearfix">
    <div class="indexsection fl">
        <!--净值标-->
        <div class="Recommendation bdr">
            <div class="ico Rec indent">推荐</div>
            <div class="hd"><b class="Net-mark">债权转让</b>投资转让项目获得更短的期限、更高的收益率</div>

            <div class="bd clearfix">
                <div class="item">
                    <div class="txt fl">
                        <h2>真我品牌公司商户进货<em class="ico">奖</em></h2>
                        <h5>借款担保方-合肥三上品牌管理公司</h5>
                        <div class="title mt40 clearfix"><span class="fr">投资期限</span>预期年化</div>
                        <div class="con mt10 clearfix"><span class="fr">1个月</span><span class="o">8<span
                                class="f18">%</span></span></div>
                    </div>
                    <div class="progress fl">
                        <div class="ui-progressbar-mid" style="background:url(${dynamicURL}/folder/images/100.png) no-repeat center;">100%
                        </div>
                        <a href="invest-list.html" class="ico btn-Tender">投标</a>
                        剩余金额 70,000元
                    </div>
                </div>
                <div class="item">
                    <div class="txt fl">
                        <h2>秦坤商业公司商户进货<em class="ico">奖</em></h2>
                        <h5>借款担保方-合肥仁义商贸公司</h5>
                        <div class="title mt40 clearfix"><span class="fr">投资期限</span>预期年化</div>
                        <div class="con mt10 clearfix"><span class="fr">3个月</span><span class="o">10.8<span class="f18">%</span></span>
                        </div>
                    </div>
                    <div class="progress fl">
                        <div class="ui-progressbar-mid" style="background:url(${dynamicURL}/folder/images/75.png) no-repeat center;">75%
                        </div>
                        <a href="invest-list.html" class="ico btn-Tender">投标</a>
                        剩余金额 250,000元
                    </div>
                </div>
                <div class="item">
                    <div class="txt fl">
                        <h2>珍珠商贸公司商户进货<em class="ico">奖</em></h2>
                        <h5>借款担保方-合肥燕莎服饰公司</h5>
                        <div class="title mt40 clearfix"><span class="fr">投资期限</span>预期年化</div>
                        <div class="con mt10 clearfix"><span class="fr">6个月</span><span class="o">12.8<span class="f18">%</span></span>
                        </div>
                    </div>
                    <div class="progress fl">
                        <div class="ui-progressbar-mid" style="background:url(${dynamicURL}/folder/images/50.png) no-repeat center;">50%
                        </div>
                        <a href="invest-list.html" class="ico btn-Tender">投标</a>
                        剩余金额 250,000元
                    </div>
                </div>
                <div class="item">
                    <div class="txt fl">
                        <h2>珍珠商贸公司商户进货<em class="ico">奖</em></h2>
                        <h5>借款担保方-合肥燕莎服饰公司</h5>
                        <div class="title mt40 clearfix"><span class="fr">投资期限</span>预期年化</div>
                        <div class="con mt10 clearfix"><span class="fr">6个月</span><span class="o">12.8<span class="f18">%</span></span>
                        </div>
                    </div>
                    <div class="progress fl">
                        <div class="ui-progressbar-mid" style="background:url(${dynamicURL}/folder/images/50.png) no-repeat center;">50%
                        </div>
                        <a href="invest-list.html" class="ico btn-Tender">投标</a>
                        剩余金额 250,000元
                    </div>
                </div>
            </div>

        </div>

        <!--信用标-->
        <div class="Recommendation mt10 bdr">
            <div class="hd clearfix"><a href="#" class="more">更多&gt;&gt;</a><b class="Net-mark">信用标</b>按月付息
                到期还本；1000元起投；工作日<b class="f14 o">10:30、14:30、17:30、20:00</b> 更新，周末与其余时间随机
            </div>
            <dl>
                <dt class="clearfix"><a href="#" class="button ico Repayment">还款中</a><em class="ico Guarantee">保</em>园博印象旅游珠宝商户进货<span
                        class="Guarantee-Agency">  担保机构：安徽融桥担保股份有限公司</span></dt>
                <dd>
                    <span class="APR-loan">借款年利率  <b class="o">10%</b> </span><span class="time">期限  90天</span><span
                        class="Investment-Amount">投资金额  25,000.00元 </span>进度<span class="process"><span
                        class="process-bar" style="width:100%"></span></span>100%
                </dd>
            </dl>
            <dl>
                <dt class="clearfix"><a href="invest-list.html" class="button ico Bid">投标</a><em
                        class="ico Guarantee">保</em>园博印象旅游珠宝商户进货<span
                        class="Guarantee-Agency">  担保机构：安徽融桥担保股份有限公司</span></dt>
                <dd>
                    <span class="APR-loan">借款年利率  <b class="o">10%</b> </span><span class="time">期限  90天</span><span
                        class="Investment-Amount">投资金额  25,000.00元 </span>进度<span class="process"><span
                        class="process-bar" style="width:75%"></span></span>75%
                </dd>
            </dl>
            <dl>
                <dt class="clearfix"><a href="invest-list.html" class="button ico Bid">投标</a><em
                        class="ico Guarantee">保</em>园博印象旅游珠宝商户进货<span
                        class="Guarantee-Agency">  担保机构：安徽融桥担保股份有限公司</span></dt>
                <dd>
                    <span class="APR-loan">借款年利率  <b class="o">10%</b> </span><span class="time">期限  90天</span><span
                        class="Investment-Amount">投资金额  25,000.00元 </span>进度<span class="process"><span
                        class="process-bar" style="width:75%"></span></span>75%
                </dd>
            </dl>
        </div>

        <!--债权转让-->
        <div class="Recommendation mt10 bdr">
            <div class="hd clearfix"><a href="#" class="more">更多&gt;&gt;</a><b class="Net-mark">净值标</b>灵活投资，每月返还本息；50元起投；工作日<b
                    class="f14 o">10:30、14:30、17:30、20:00</b> 更新，周末与其余时间随机
            </div>
            <dl>
                <dt class="clearfix"><a href="#" class="button ico Repayment">还款中</a><em class="ico Guarantee">保</em>园博印象旅游珠宝商户进货<span
                        class="Guarantee-Agency">  担保机构：安徽融桥担保股份有限公司</span></dt>
                <dd>
                    <span class="APR-loan">借款年利率  <b class="o">10%</b> </span><span class="time">期限  90天</span><span
                        class="Investment-Amount">投资金额  25,000.00元 </span>进度<span class="process"><span
                        class="process-bar" style="width:100%"></span></span>100%
                </dd>
            </dl>
            <dl>
                <dt class="clearfix"><a href="invest-list.html" class="button ico Bid">投标</a><em
                        class="ico Guarantee">保</em>园博印象旅游珠宝商户进货<span
                        class="Guarantee-Agency">  担保机构：安徽融桥担保股份有限公司</span></dt>
                <dd>
                    <span class="APR-loan">借款年利率  <b class="o">10%</b> </span><span class="time">期限  90天</span><span
                        class="Investment-Amount">投资金额  25,000.00元 </span>进度<span class="process"><span
                        class="process-bar" style="width:75%"></span></span>75%
                </dd>
            </dl>
            <dl>
                <dt class="clearfix"><a href="invest-list.html" class="button ico Bid">投标</a><em
                        class="ico Guarantee">保</em>园博印象旅游珠宝商户进货<span
                        class="Guarantee-Agency">  担保机构：安徽融桥担保股份有限公司</span></dt>
                <dd>
                    <span class="APR-loan">借款年利率  <b class="o">10%</b> </span><span class="time">期限  90天</span><span
                        class="Investment-Amount">投资金额  25,000.00元 </span>进度<span class="process"><span
                        class="process-bar" style="width:75%"></span></span>75%
                </dd>
            </dl>
        </div>

    </div>

    <div class="indexaside fr">
        <!--video-->
        <div class="video">
            <iframe height=227 width=100% src="http://player.youku.com/embed/XODY1NjI0Mjc2" frameborder=0
                    allowfullscreen></iframe>
        </div>

        <div class="mt10 bd bdr">
            <!--Notice-->
            <div class="hd clearfix"><a href="news.html" class="more">更多&gt;&gt;</a>网站公告</div>
            <ul class="Notice cicle clearfix">
                <li><span class="time">[10-11]</span><a href="newshow.html">电子工程师严定贵的二次创业</a></li>
                <li><span class="time">[10-11]</span><a href="newshow.html">严定贵：互联网大鳄搅局将抬高</a></li>
                <li><span class="time">[10-11]</span><a href="newshow.html">以产品定义为先导 促P2P阳光化</a></li>
                <li><span class="time">[10-11]</span><a href="newshow.html">IT168视频采访副总裁刘瑶</a></li>
                <li><span class="time">[10-11]</span><a href="newshow.html">IT168视频采访副总裁刘瑶</a></li>
                <li><span class="time">[10-11]</span><a href="newshow.html">P2P监管“冲刺” 市场迎洗牌</a></li>
            </ul>
            <!-- reports-->
            <div class="hd mt10 clearfix"><a href="reports.html" class="more">更多&gt;&gt;</a>媒体报道</div>
            <div class="reports mt10 clearfix">
                <dl class="clearfix">
                    <dt class="img"><a href="reportshow.html"><img src="${dynamicURL}/folder/upload/img5.jpg"></a></dt>
                    <dd><a href="newshow.html">互联网金融应该充当毛细血管的角色-上海法治声音</a></dd>
                </dl>
                <dl class="clearfix">
                    <dt class="img"><a href="reportshow.html"><img src="${dynamicURL}/folder/upload/img6.jpg"></a></dt>
                    <dd><a href="newshow.html">互联网金融应该充当毛细血管的角色-上海法治声音</a></dd>
                </dl>
            </div>

        </div>

        <!--ad-->
        <div class="ad img mt10"><a href="#" class="btn-reg"><img src="${dynamicURL}/folder/upload/img7.jpg"></a></div>

        <!--about-->
        <div class="mt10 bd bdr">
            <div class="hd clearfix"><a href="about.html" class="more">更多&gt;&gt;</a>关于我们</div>
            <div class="txt clearfix">
                　　万国集团成立于2009年，是专业从事商业地产开发、运营、管理及小额贷款等融资投资机构，由占安徽服饰市场三分天下的众多实力品牌省级代理商联合打造。自成立以来，始终秉承“全力塑造优质地产品牌，全心服务社会建设目标”的商业宗旨，致力于推进安徽服装商业地产的全面升级。
            </div>
        </div>

        <!--Billboard-->
        <div class="mt10 bd bdr">
            <div class="hd clearfix">理财风云榜</div>
            <table class="Billboard-tab">
                <tr>
                    <th width="40">排名</th>
                    <th width="60">用户名</th>
                    <th width="105">投资金额</th>
                    <th class="tr">排名变化</th>
                </tr>
                <tr>
                    <td><span class="ico three">1</span></td>
                    <td>L****U</td>
                    <td class="o">&yen;12,124,356,565.12</td>
                    <td class="tc">-</td>
                </tr>
                <tr>
                    <td><span class="ico three">2</span></td>
                    <td>L****U</td>
                    <td class="o">&yen;12,124,356,565.12</td>
                    <td class="tc">-</td>
                </tr>
                <tr>
                    <td><span class="ico three">3</span></td>
                    <td>L****U</td>
                    <td class="o">&yen;12,124,356,565.12</td>
                    <td class="tc">-</td>
                </tr>
                <tr>
                    <td><span class="behind">4</span></td>
                    <td>L****U</td>
                    <td class="o">&yen;12,124,356,565.12</td>
                    <td class="tc">-</td>
                </tr>
                <tr>
                    <td><span class="behind">5</span></td>
                    <td>L****U</td>
                    <td class="o">&yen;12,124,356,565.12</td>
                    <td class="tc">-</td>
                </tr>
            </table>
        </div>

    </div>
</div>