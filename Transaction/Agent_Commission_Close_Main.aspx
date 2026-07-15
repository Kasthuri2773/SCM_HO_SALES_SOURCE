<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="Agent_Commission_Close_Main.aspx.cs" Inherits="Agent_Commission_Close_Main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script src='<%= ResolveUrl("../assets/js/master_list_jquery.min.js") %>'></script>
<script src='<%= ResolveUrl("../assets/js/master_list_jquery-ui.min.js") %>'></script>

<script type="text/javascript">
    //On UpdatePanel Refresh
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    if (prm != null) {
        prm.add_endRequest(function(sender, e) {
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

<script type="text/javascript">
    //On UpdatePanel Refresh
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    if (prm != null) {
        prm.add_endRequest(function(sender, e) {
            if (sender._postBackSettings.panelsToUpdate != null) {
                $('.date-picker').datepicker({ format: 'dd/mm/yyyy' });
                $('.js-states').select2();
            }
        });
    };
</script>



<div class="page-breadcrumb">
                    <ol class="breadcrumb container">
                   <h4><li class="active">Agent Commission Status Update</li></h4> 
                    </ol>
                </div>
<div id="main-wrapper" class="container">
 <div class="row">
    <div class="col-md-12">
        
            <div class="col-md-9">
			<div class="panel panel-white">
			<div class="panel panel-primary">
				<div class="panel-heading clearfix">
					<h4 class="panel-title">Agent Commission Status Update</h4>
				</div>
				</div>
				<form class="form-horizontal">
				<div class="panel-body">
					
                    <div class="form-group row"></div>
		            <!-- table start -->
			        <div class="col-md-12">
			            <div class="row">
			                <asp:Repeater ID="Repeater_Pending" runat="server" EnableViewState="false">
			                    <HeaderTemplate>
                                    <table id="example" class="display table">
                                        <thead>
                                            <tr>
                                            <%--<th>User</th>--%>
                                                <th>Invoice No</th>
                                                <th>Date</th>                                                
                                                <th>Agent Name</th>
                                                <th>Bill Amt</th>
                                                <th>Comm. Type</th>
                                                <th>Comm. Rate</th>
                                                <th>Comm. Amt</th>
                                                <th>View</th>
                                                <%--<th>Report</th>--%>
                                               </tr>
                                        </thead>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                    <%--<td><%# Eval("UserId")%></td>--%>
                                        <td><%# Eval("Wit_Sal_Order_InvNo")%></td>
                                        <td><%# Eval("Wit_Sal_Order_INVDate")%></td>
                                        <td><%# Eval("AgentName")%></td>
                                        <td><%# Eval("NetAmount")%></td>
                                        <td><%# Eval("Agent_Comm_Type")%></td>
                                        <td><%# Eval("Agent_Comm_Rate_Percent")%></td>
                                        <td><%# Eval("Agent_Comm_Amt")%></td>
                                        <td>
                                            <asp:LinkButton ID="btnReq_View" class="btn btn-primary btn-sm fa fa-external-link-square"  runat="server" 
                                                        Text="" OnCommand="GridEditPurRequestClick" CommandArgument='<%# Eval("Wit_Sal_Order_InvNo")%>' CommandName='View'>
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate></table></FooterTemplate>                                
			                </asp:Repeater>
			            </div>
			        </div>
			        <!-- table End -->
			        
			      
						
                   </div><!-- panel body end -->     
				</form>
			
			</div><!-- panel white end -->
		    </div><!-- col-9 end -->
		    
		     <!-- Dashboard start -->
		     <div class="col-lg-3 col-md-6">
                            <div class="panel panel-white" style="height: 100%;">
                                <div class="panel-heading">
                                    <h4 class="panel-title">Dashboard Details</h4>
                                    <div class="panel-control">
                                        
                                        
                                    </div>
                                </div>
                                <div class="panel-body">
                                    
                                    
                                </div>
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
		   <div class="col-md-2"></div>
		    
            
      
         
 </div>     <!-- col 12 end -->
  </div><!-- row end -->
 </div><!-- main-wrapper end -->

</asp:Content>

