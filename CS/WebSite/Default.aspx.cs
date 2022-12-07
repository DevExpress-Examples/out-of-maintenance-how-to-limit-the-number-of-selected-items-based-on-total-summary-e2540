using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page {

    protected void ASPxTextBox1_Init(object sender, EventArgs e) {
        (sender as ASPxTextBox).Text = "100";
    }
}
