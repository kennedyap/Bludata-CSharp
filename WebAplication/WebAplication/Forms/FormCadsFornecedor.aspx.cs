using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAplication.Forms
{
    public partial class FormCadsFornecedor : System.Web.UI.Page
    {
        public string PostBackUrl { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new Functions().CarregaTabelas("SELECT * FROM Empresa");

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                drpEmpresas.Items.Add(dt.Rows[i].ItemArray[2].ToString());
            }

            txtData_cads.Text = DateTime.Now.ToString();
        }

        protected void btn_Salvar_Click(object sender, EventArgs e)
        {
            try
            {
                bool isPr = CheckEmpresa(drpEmpresas.SelectedItem.Text);

                if (isPr && txtNome_Fornecedor.Text != "" && drpEmpresas.SelectedValue != "" && (rdbCPF.Checked && txtCPFCNPJ.Text != "") && txtData_cads.Text != "")
                {
                    bool maiorIdade = CalculateIdade(Convert.ToDateTime(txtDtNascimento.Text));

                    if (maiorIdade)
                    {
                        Insert(drpEmpresas.SelectedItem.Text, txtNome_Fornecedor.Text, Convert.ToInt32(txtCPFCNPJ.Text), Convert.ToDateTime(txtData_cads.Text), txtTelefone.Text, txtRG.Text, txtDtNascimento.Text);

                        Response.Write("<script>alert('Cadastro realizado com Sucesso.');</script>");

                        txtCPFCNPJ.Text = "";
                        txtData_cads.Text = "";
                        txtDtNascimento.Text = "";
                        txtNome_Fornecedor.Text = "";
                        txtRG.Text = "";
                        txtTelefone.Text = "";
                    }
                    else
                    {
                        Response.Write("<script>alert('Empresas do Paraná, não podem aceitar Fornecedores menores de Idade.');</script>");
                    }
                }
                else
                {
                    if (txtNome_Fornecedor.Text != "" && drpEmpresas.SelectedValue != "" && (rdbCPF.Checked && txtCPFCNPJ.Text != "" || rdbCNPJ.Checked && txtCPFCNPJ.Text != "") && txtData_cads.Text != "")
                    {
                        Insert(drpEmpresas.SelectedItem.Text, txtNome_Fornecedor.Text, Convert.ToInt32(txtCPFCNPJ.Text), Convert.ToDateTime(txtData_cads.Text), txtTelefone.Text, txtRG.Text, txtDtNascimento.Text);

                        Response.Write("<script>alert('Cadastro realizado com Sucesso.');</script>");

                        txtCPFCNPJ.Text = "";
                        txtData_cads.Text = "";
                        txtDtNascimento.Text = "";
                        txtNome_Fornecedor.Text = "";
                        txtRG.Text = "";
                        txtTelefone.Text = "";
                    }
                    else
                    {
                        Response.Write("<script>alert('Revise os campos e tente novamente.');</script>");
                    }
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

        protected void btnAdc_Telefone_Click(object sender, EventArgs e)
        {
            SqlConnection cnx = new SqlConnection(new Functions().conectionString);
            cnx.Open();

            string sql = string.Format("INSERT INTO Telefone (Fornecedor, Telefone) VALUES ('" + txtNome_Fornecedor.Text + "','"+ txtTelefone.Text +"')");
            SqlCommand cmd = new SqlCommand(sql, cnx);
            cmd.ExecuteNonQuery();

            DataTable dt = new DataTable();
            dt = new Functions().CarregaTabelas("SELECT * FROM Telefone WHERE Fornecedor ='" + txtNome_Fornecedor.Text + "'");
            GridTelefone.DataSource = dt;
            GridTelefone.DataBind();

            txtTelefone.Text = "";
        }

        public static bool CalculateIdade(DateTime maskDataNask)
        {
            int anos = DateTime.Now.Year - maskDataNask.Year;

            if (anos < 18)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        public static void Insert(string empresa, string nome, int cpfCnpj, DateTime dtCads, string telefone, string rg = "", string dtNascimento = "")
        {
            SqlConnection cnx = new SqlConnection(new Functions().conectionString);
            cnx.Open();

            string sql = string.Format("INSERT INTO Fornecedor (Empresa, Nome, CpfCnpj, DtCads, Telefone, Rg, DtNascimento) VALUES ('" + empresa + "', '" + nome + "' ,'" + cpfCnpj) + "','" + dtCads + "','" + telefone + "','" + rg + "','" + dtNascimento + "')";
            SqlCommand cmd = new SqlCommand(sql, cnx);
            cmd.ExecuteNonQuery();
        }
        public static bool CheckEmpresa(string cnpj)
        {
            DataTable dt = new Functions().CarregaTabelas("SELECT * FROM Empresa WHERE CNPJ =" + cnpj);

            if (Convert.ToString(dt.Rows[0].ItemArray[0]) == "PR")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}