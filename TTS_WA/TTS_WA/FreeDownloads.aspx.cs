﻿using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TTS
{
    public partial class FreeDownloads : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.PageTitle = "Free Downloads";
            this.Master.MetaTag = "<meta name=\"robots\" content=\"index,follow\" /> "; 

        }
    }
}