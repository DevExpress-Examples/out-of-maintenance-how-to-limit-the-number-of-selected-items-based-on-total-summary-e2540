<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v10.1, Version=10.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.1, Version=10.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASPxGridView - limit count</title>

    <script type="text/javascript" language="javascript">
        var initAmount = 100;
        var index;
        function OnSelectionChanged(s, e) {
            index = e.visibleIndex;
            s.GetSelectedFieldValues('UnitPrice', OnGetSelectedFieldValues);
        }
        function OnGetSelectedFieldValues(values) {
            var totalAmount = initAmount;
            for (i = 0; i < values.length; i++)
                totalAmount -= values[i];

            if (totalAmount < 0) {
                grid.UnselectRowOnPage(index);
            }
            else
                tbTotalAmount.SetText(totalAmount);
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <dx:ASPxLabel ID="ASPxLabelError" runat="server" Text="Note, you have only 100 $"
        ForeColor="#FF3300">
    </dx:ASPxLabel>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" ClientInstanceName="grid" AutoGenerateColumns="False"
        DataSourceID="AccessDataSource1" KeyFieldName="ProductID">
        <Templates>
            <TitlePanel>
                <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" ClientInstanceName="tbTotalAmount"
                    Width="170px" OnInit="ASPxTextBox1_Init">
                </dx:ASPxTextBox>
            </TitlePanel>
        </Templates>
        <ClientSideEvents SelectionChanged="OnSelectionChanged" />
        <Columns>
            <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowTitlePanel="True" />
    </dx:ASPxGridView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT [ProductName], [ProductID], [UnitPrice] FROM [Products]">
    </asp:AccessDataSource>
    </form>
</body>
</html>
