using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Net;
namespace TTS_WA
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Error(object sender, EventArgs e)
        {
            Exception ex = HttpContext.Current.Server.GetLastError();

            if (ex is HttpUnhandledException && ex.InnerException != null)
            {
                    ex = ex.InnerException;
            }

            if (ex != null && ConfigurationManager.AppSettings["SendErrorEmail"].ToLower() == "yes")
            {
                try {
                    string ToEmail = ConfigurationManager.AppSettings["ErrorToEmailAddr"];
                    System.Net.Mail.MailMessage mailMsg = new System.Net.Mail.MailMessage("TTS@Error.com", ToEmail);

                    mailMsg.Subject = "TTS: An Error has occured!";
                    mailMsg.Body = string.Format("An unhandled exception occurred:{0} Message: {1}{0}{0} Stack Trace:{0}{2}", System.Environment.NewLine, ex.Message, ex.StackTrace);
                    mailMsg.IsBodyHtml = false;

                    System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient();
                    smtp.UseDefaultCredentials = false;
                    smtp.Port = 587;
                    smtp.Credentials = new NetworkCredential("usefem369@gmail.com","butterfly@1");
                    smtp.EnableSsl = true;
                    smtp.Host = ConfigurationManager.AppSettings["smtp_server"];
                    smtp.Send(mailMsg);
                }
                catch (Exception objEx) {
                    
                    Response.Redirect("Error.aspx");
                }


            }
        }


    }
}