using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using Altius.BusinessAccessLayer.BALDataAccess;

public partial class Agent_Commission_Close_Main : System.Web.UI.Page
{
    BALDataAccess objdata = new BALDataAccess();
    TransactionNoGenerate CommonClass_Function = new TransactionNoGenerate();
    string SessionCcode;
    string SessionLcode;
    string SessionUserID;
    string SessionUserName;
    string SessionFinYearCode;
    string SessionFinYearVal;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("../Default.aspx");
            Response.Write("Your session expired");
        }
        SessionCcode = Session["Ccode"].ToString();
        SessionLcode = Session["Lcode"].ToString();
        SessionUserName = Session["Usernmdisplay"].ToString();
        SessionUserID = Session["UserId"].ToString();
        SessionFinYearCode = Session["FinYearCode"].ToString();
        SessionFinYearVal = Session["FinYear"].ToString();
        if (!IsPostBack)
        {
            Page.Title = "ERP Sales Module :: Agent Commission Status Update";
            HtmlGenericControl li = (HtmlGenericControl)(Page.Master.FindControl("Link_Sales"));
            li.Attributes.Add("class", "droplink active open");
            //Department_Code_Add();

            //Department_Code_Add_Test();

        }
        Load_Data_Empty_Grid();
    }

    private void Load_Data_Empty_Grid()
    {
        string query = "";
        DataTable DT = new DataTable();
        DataTable DT1 = new DataTable();
        DataTable DT2 = new DataTable();

        query = "Select Wit_Sal_Order_InvNo,Wit_Sal_Order_INVDate,AgentName,NetAmount,Agent_Comm_Type,Agent_Comm_Rate_Percent,";
        query = query + " Agent_Comm_Amt from Direct_YarnInv_Main where Ccode='" + SessionCcode + "' And Lcode='" + SessionLcode + "'";
        query = query + " And FM_Status='1' And isnull(Agent_Comm_Amt,0) > 0 And (Agent_Comm_Paid_Status is null or Agent_Comm_Paid_Status='')";
        DT = objdata.RptEmployeeMultipleDetails(query);
        
        Repeater_Pending.DataSource = DT;
        Repeater_Pending.DataBind();
    }

    protected void GridEditPurRequestClick(object sender, CommandEventArgs e)
    {
        string SalOrder_No_Str = e.CommandArgument.ToString();

        Session.Remove("Agent_Comms_Inv_No");
        Session["Agent_Comms_Inv_No"] = SalOrder_No_Str;
        Response.Redirect("~/Transaction/Agent_Commission_Update_Sub.aspx");
    }
}