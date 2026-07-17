<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="Agent_Commission_Payment_Entry_Main.aspx.cs" Inherits="Transaction_Agent_Commission_Payment_Entry_Main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        //On UpdatePanel Refresh
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm != null) {
            prm.add_endRequest(function (sender, e) {
                if (sender._postBackSettings.panelsToUpdate != null) {
                    $('#example').dataTable();
                }
            });
        };
    </script>

    <script type="text/javascript">
        function SaveMsgAlert(msg) {
            swal(msg);
        }
    </script>

    <div class="page-breadcrumb">
        <ol class="breadcrumb container">
            <h4>
                <li class="active">Agent Commission Payment Details</li>
            </h4>
        </ol>
    </div>
    <div id="main-wrapper" class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-12">
                    <div class="panel panel-white">
                        <div class="panel panel-primary">
                            <div class="panel-heading clearfix">
                                <h4 class="panel-title">Agent Commission Payment Details</h4>
                            </div>
                        </div>
                        <form class="form-horizontal">
                            <div class="panel-body">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="form-group col-md-4">
                                            <asp:Button ID="btnAddNew" class="btn btn-success" runat="server" Text="Add New" OnClick="btnAddNew_Click" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row"></div>
                                <div class="form-group row"></div>
                                <!-- table start -->
                                <div class="col-md-12">
                                    <div class="row">
                                        <asp:Repeater ID="Repeater2" runat="server" EnableViewState="false">
                                            <HeaderTemplate>
                                                <table id="example" class="display table">
                                                    <thead>
                                                        <tr>
                                                            <th>Sl_No</th>
                                                            <th>Trans No</th>
                                                            <th>Date</th>
                                                            <th>Agent Account Name</th>
                                                            <th>Invoice Date</th>
                                                            <th>Agent Bill No</th>
                                                            <th>Payment Amount</th>
                                                            <th>Mode</th>
                                                        </tr>
                                                    </thead>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Container.ItemIndex + 1 %></td>
                                                    <td><%# Eval("Trans_No")%></td>
                                                    <td><%# Eval("Trans_Date")%></td>
                                                    <td><%# Eval("Agent_Acc_Name")%></td>
                                                    <td><%# Eval("Invoice_Date")%></td>
                                                    <td><%# Eval("Agent_Bill_No")%></td>
                                                    <td><%# Eval("Final_Paid_Amt")%></td>
                                                    <td>
                                                        <asp:LinkButton ID="btnEditEnquiry_Grid" class="btn btn-success btn-sm fa fa-pencil" runat="server"
                                                            Text="" OnCommand="GridEditEnquiryClick" CommandArgument="Edit" CommandName='<%# Eval("Trans_No")%>'>
                                                        </asp:LinkButton>
                                                        <asp:LinkButton ID="btnDeleteEnquiry_Grid" class="btn btn-danger btn-sm fa fa-trash-o" runat="server"
                                                            Text="" OnCommand="GridDeleteEnquiryClick" CommandArgument="Delete" CommandName='<%# Eval("Trans_No")%>'
                                                            CausesValidation="true" OnClientClick="return confirm('Are you sure you want to delete this Voucher details?');">
                                                        </asp:LinkButton>
                                                        <asp:LinkButton ID="LinkButton1" class="btn btn-success btn-sm fa fa-print" runat="server"
                                                            Text="" OnCommand="GridReportClick" CommandArgument='<%# Eval("Trans_No")%>' CommandName='Edit'>
                                                        </asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate></table></FooterTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                                <!-- table End -->
                            </div>
                            <!-- panel body end -->
                        </form>
                    </div>
                    <!-- panel white end -->
                </div>
                <!-- col-9 end -->

                <!-- Dashboard start -->
                <%--<div class="col-lg-3 col-md-6">
			    <div class="panel panel-white" style="height: 100%;">
                    <div class="panel-heading">
                        <h4 class="panel-title">Dashboard Details</h4>
                        <div class="panel-control"></div>
                    </div>
                    <div class="panel-body"></div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-white">
                    <div class="panel-body">
                        <div class="live-tile flip ha" data-mode="flip" data-speed="750" data-delay="3000">
                        </div>
                    </div>
                </div>
                <div class="panel panel-white">
                    <div class="panel-body">
                        <div class="live-tile flip ha" data-mode="flip" data-speed="750" data-delay="3000">
                        </div>
                    </div>
                </div>
            </div>
			<!-- Dashboard End -->
			<div class="col-md-2"></div>--%>
            </div>
            <!-- col 12 end -->
        </div>
        <!-- row end -->
    </div>
    <!-- main-wrapper end -->

</asp:Content>

