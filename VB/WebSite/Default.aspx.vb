Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxEditors

Partial Public Class _Default
	Inherits System.Web.UI.Page

	Protected Sub ASPxTextBox1_Init(ByVal sender As Object, ByVal e As EventArgs)
		TryCast(sender, ASPxTextBox).Text = "100"
	End Sub
End Class
