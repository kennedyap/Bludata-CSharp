using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebAplication
{
    public class Functions
    {
        public string conectionString = @"Data Source = (LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Usuario\source\repos\WebAplication\WebAplication\App_Data\DbWebConfig.mdf;Integrated Security = True";

        public DataTable CarregaTabelas (string sql)
        {
            SqlConnection conexao = new SqlConnection(conectionString);
            conexao.Open();
            SqlDataAdapter adp = new SqlDataAdapter(sql, conexao);
            DataTable dst = new DataTable();
            adp.Fill(dst);

            return dst;
        }
    }
}