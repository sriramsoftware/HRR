﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReviewListView.ascx.cs" Inherits="HRR.Website.Views.ReviewListView" %>
<telerik:RadCodeBlock runat="server" ID="rcbGoalListView">
    <script language="javascript" type="text/javascript">
        $(window).load(function () {
            //$(".collapsibleContainerContent").slideToggle();
            
            $("#expander").hover(function () {
                $(this).css('cursor', 'pointer');
            });
            loadProgress();

            $("#expander").click(function () {

                $(".collapsibleContainerContent").slideToggle();
                $(this).toggleClass("acc_triggercollapse acc_triggerexpand");
            });

            function loadProgress() {
                $(".progress").each(function () {
                    var v = eval($(this).attr("goalid"));
                    $(this).progressbar({
                        value: v
                    }).children("span").appendTo(this);
                    $(this).find(".progresslabelingrid").html($(this).attr("goalid") + "% complete");
                });
            }
        });
    </script>  
</telerik:RadCodeBlock>
<div class="three_fourth last_column">
    <div style="float: right;" >
        <span>
            <idea:LinkButton
            runat="server"
            ID="lbRatingScales"
            OnClick="RatingScalesClicked">
                <img src="/images/star_full16.png" alt="" /> Manage Rating Scales
            </idea:LinkButton>
        </span>
        <span>
            <idea:LinkButton
            runat="server"
            ID="lbTemplates"
            OnClick="TemplatesClicked">
                <img src="/images/note16.png" alt="" /> Manage Review Templates
            </idea:LinkButton>
        </span>
    </div>
        <div style="float: left;">
            <img src='/Images/clipboard48.png' style="margin-top: 5px; margin-bottom: 10px;" height="48px" width="48px" border="0" alt="" /> <h3 style="display:inline !important;">Current Review Activity </h3>
        </div>
    <div style="clear:both;"/>
    <div style=" margin-top: 5px !important;">
        <span id="expander" class="acc_triggercollapse" style="padding-top: 2px; color:#333333; ">Click to collapse/expand ALL departments</span>
    </div>  
<div id="divReview" runat="server"/>

<div style="margin-bottom: 50px;">
            <asp:Repeater
            runat="server"
            OnItemDataBound="MasterItemDataBound"
            ID="dlReviews">
                <HeaderTemplate>
                    <div style="overflow:auto">
                </HeaderTemplate>
                <ItemTemplate>
                    <div runat="server" id="divTitle" class="collapsibleContainer" 
                    paneltitle="" style="margin-bottom: 5px;">
                        <asp:Repeater 
                        ID="nestedDataList" 
                        OnItemDataBound="NestedItemDataBound"
                        runat="server">
                            <ItemTemplate>

                                <div runat="server" id="divPerson" 
                                style="padding: 3px; background-color: #eeeeee; margin-top: 15px; margin-bottom: 20px;">
                                    <div style="overflow:auto; background-color: #ffffff; padding: 10px;">
                                        <div style="float: right;">
                                            <span runat="server" id="spnAddNewReview">
                                                <a title="Create New Review" href="/Reviews/New/<%# Eval("ID").ToString() %>">
                                                    <img src="/Images/add.png" title="Create New Review" alt=""/>New Review
                                                </a>
                                            </span>
                                        </div>
                                        <div style="float: left; margin-left: 5px; margin-right: 5px;">
                                            <telerik:RadBinaryImage ID="rbiProfile"
                                            runat="server"
                                            Width="50px"
                                            Height="50px"
                                            ResizeMode="Fit"
                                            DataValue='<%# HRR.Web.Utils.ImageResize.GetImageBytes(Eval("AvatarPath").ToString())  %>'
                                            style="padding: 0px 0px 5px 0px;"/>
                                        </div>
                                        <div style="float: left; margin-left: 0px; margin-bottom: 10px; width: 620px; margin-top: -28px;">
                                            <span style="font-size: 12pt;">
                                                <a href="/People/<%# Eval("Email").ToString() %>">
                                                    <%# Eval("Name").ToString() %>
                                                </a>
                                            </span> - 
                                            <span style="font-size: 10pt; color: #333333;">
                                                <%# Eval("Title") %>
                                            </span>
                                        </div>
                                        <div style="clear: both;float:left; margin-top: 3px;margin-left: 5px; margin-right: 5px; width: 700px;">
                                            <table style="font-size: 8pt; color: #000000;padding: 15px; width: 700px; margin-bottom: 25px;">
                                                <tr style="background-color: #51C9FF; color: #ffffff; padding: 25px; height: 25px; font-size: 14px;">
                                                    <td style="width: 325px; padding-left: 5px;">
                                                        Title
                                                    </td>
                                                    <td style="width:100px;">
                                                        Due Date
                                                    </td>
                                                    <%--<td style="width:250px;">
                                                        Goal Status
                                                    </td>--%>
                                                    <td style="width:45px;">
                                                        Score
                                                    </td>
                                                    <td style="width:75px;">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <asp:Repeater 
                                                ID="nestedGoalsDataList" 
                                                OnItemDataBound="NestedGoalsItemDataBound"
                                                runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td style="padding: 0px 5px;">
                                                                <%# Eval("Title") %>
                                                            </td>
                                                            <td style="padding: 0px 5px;">
                                                                <%# DateTime.
                                                                Parse(Eval("DueDate").ToString()).ToShortDateString() %>
                                                            </td>
                                                            <%--<td>
                                                                <div id="progressbar" 
                                                                class="progress" 
                                                                goalid="<%# Eval("StatusID") %>"
                                                                title="<%# Eval("StatusID") %>  % complete"
                                                                style="vertical-align: top; margin-left: 0px; 
                                                                margin-bottom: 5px; 
                                                                width:200px; 
                                                                height:1em; ">
                                                                    <idea:Label
                                                                        runat="server"
                                                                        ID="lblProgressText" class="progresslabelingrid"/>
                                                                </div>
                                                            </td>--%>
                                                            <td>
                                                                 <div style='margin-left: 15px;'>
                                                                    <%# Eval("Score") %>
                                                                </div>
                                                            </td>
                                                            <td style="width: 150px;">
                                                                <div style='float: right; margin-top: 10px; margin-right: 5px;'><a href='/Reviews/<%# Eval("ID") %>'>
                                                                <img src='/images/pencil.png' border='0' title='View Review' />View</a></div>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
        </div>
</div>