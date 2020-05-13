using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAplication.Forms
{
    public partial class FormCadsProfessor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btn_Salvar_Click(object sender, EventArgs e)
        {
            SqlConnection cnx = new SqlConnection(new Functions().conectionString);
            cnx.Open();

            try
            {
                if (txtCNPJ.Text != "" && txtNomeFantasia.Text != "" && drpUF.SelectedIndex != 0)
                {
                    string sql = string.Format("INSERT INTO Empresa (UF, NomeFantasia, CNPJ) VALUES ('" + drpUF.SelectedItem.Text + "', '" + txtNomeFantasia.Text + "' ,'" + txtCNPJ.Text) + "')";
                    SqlCommand cmd = new SqlCommand(sql, cnx);
                    cmd.ExecuteNonQuery();

                    txtCNPJ.Text = "";
                    txtNomeFantasia.Text = "";

                    Response.Write("<script>alert('Cadastro realizado com Sucesso.');</script>");
                }
                else
                {
                    throw new Exception();
                }
            }
            catch (Exception ex)
            {         
                if (ex.Message != "")
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Revise os campos e tente novamente.');</script>");
                }
            }
        }
    }
}