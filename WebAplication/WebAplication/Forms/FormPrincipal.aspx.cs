using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAplication.Forms
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new Functions().CarregaTabelas("SELECT * FROM Fornecedor");
            GridFornecedor.DataSource = dt;
            GridFornecedor.DataBind();

            DataTable dt1 = new Functions().CarregaTabelas("SELECT * FROM Empresa");
            GridEmpresas.DataSource = dt1;
            GridEmpresas.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txtFiltroFornecedor.Text != "")
            {
                DataTable dtatualizado = new Functions().CarregaTabelas("SELECT * FROM FORNECEDOR WHERE " + drpFiltros.SelectedItem.Value + "='" + txtFiltroFornecedor.Text + "'");
                GridFornecedor.DataSource = dtatualizado;
                GridFornecedor.DataBind();
            }
            else
            {
                DataTable dtatualizado = new Functions().CarregaTabelas("SELECT * FROM FORNECEDOR");
                GridFornecedor.DataSource = dtatualizado;
                GridFornecedor.DataBind();
            }      
        }
    }
}