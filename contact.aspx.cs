using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

namespace Restaurant.Restaurant
{
    public partial class contact : System.Web.UI.Page
    {
        private string to;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txt_email_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                if (txt_name.Text == "" || txt_email.Text == "" ||  txt_msg.Text == "" )
                {
                    string script = "alert('All Fields are required Please fill the All...!');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
                }
                else
                {
                    
                    string Connection = ConfigurationManager.ConnectionStrings["restaurantconnection"].ConnectionString;
                    SqlConnection con = new SqlConnection(Connection);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("sp_feedback", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter param1 = new SqlParameter("@name", SqlDbType.VarChar);
                    cmd.Parameters.Add(param1).Value = txt_name.Text;
                    SqlParameter param2 = new SqlParameter("@email", SqlDbType.VarChar);
                    cmd.Parameters.Add(param2).Value = txt_email.Text;
                    SqlParameter param3 = new SqlParameter("@subject", SqlDbType.VarChar);
                    cmd.Parameters.Add(param3).Value = txt_sub.Text;
                    SqlParameter param4 = new SqlParameter("@message", SqlDbType.VarChar);
                    cmd.Parameters.Add(param4).Value = txt_msg.Text;
                    
                    int i = cmd.ExecuteNonQuery();

                    if (i > 0)
                    {
                        Response.Write("Message send  Sucessfully ");
                        string messages = "Message will be send successfully." + "Thank you for your Visiting...!";
                        string script = "window.onload = function(){ alert('";
                        script += messages;
                        script += "')};";
                        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                    }
                    else
                    {
                        Response.Write("Somethig was Worng....!");
                    }
                    con.Close();

                    String from, pass, messageBody;


                    MailMessage message = new MailMessage();
                    to = "velan635802@gmail.com";
                    from = "pettapetta26@gmail.com";
                    pass = "ivpfzmkeevojurzu";
                    messageBody = "Name : " + txt_name.Text + " Email: " + txt_email.Text + " Subject: " + txt_sub.Text + " Messaage : " + txt_msg.Text;
                    message.To.Add(to);
                    message.From = new MailAddress(from);
                    message.Body = messageBody;
                    message.Subject = "The New Arabic Restaurant";
                    SmtpClient smtp = new SmtpClient("smtp.gmail.com");
                    smtp.EnableSsl = true;
                    smtp.Port = 587;
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp.Credentials = new NetworkCredential(from, pass);

                    try
                    {
                        smtp.Send(message);

                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

            
        }  
        protected void txt_msg_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txt_sub_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txt_name_TextChanged(object sender, EventArgs e)
        {

        }
    }
}