using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using DasDAL;

namespace DasShop
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            var ex = Server.GetLastError();
            var httpException = ex as HttpException;
            var httpCode = httpException != null
                ? httpException.GetHttpCode()
                : 0;
            
            // Ignore 404 errors
            if (httpCode == 404)
            {
                return;
            }

            //Logging exeption to db
            WriteToDB(new DasDBDataContext(), ex);

            // Show a friendy error, instead of yellow error screen
            Server.Transfer("/ErrorPages/ErrorPage.aspx");
        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }

        public static void WriteToDB(DasDBDataContext db, Exception ex)
        {
            try
            {
                var log = new LogEntry();
                log.Date = DateTime.Now.ToLocalTime();
                log.IsError = true;
                log.Message = ex.ToString();

                db.LogEntries.InsertOnSubmit(log);
                db.SubmitChanges();

            }
            catch (Exception)
            {
                throw;
                // Game over
            }
        }

    }
}