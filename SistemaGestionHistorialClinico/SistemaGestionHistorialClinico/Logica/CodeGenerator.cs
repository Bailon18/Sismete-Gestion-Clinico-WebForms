using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

namespace SistemaGestionHistorialClinico.Logica
{

    public class CodeGenerator
    {
        private static Random random = new Random();

        public string GenerateCode(string prefix, int length = 4)
        {
            string randomPart = GenerateRandomString(length); 
            return $"{prefix}-{randomPart}";
        }

        private string GenerateRandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            StringBuilder result = new StringBuilder(length);
            for (int i = 0; i < length; i++)
            {
                result.Append(chars[random.Next(chars.Length)]);
            }
            return result.ToString();
        }
    }

}