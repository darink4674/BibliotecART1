//------------------------------------------------------------------------------
// <auto-generated>
//    Этот код был создан из шаблона.
//
//    Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//    Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BibliotecART.Connection
{
    using System;
    using System.Collections.Generic;
    
    public partial class Readers
    {
        public Readers()
        {
            this.LibraryCards = new HashSet<LibraryCards>();
        }
    
        public int ReaderID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string Password { get; set; }
    
        public virtual ICollection<LibraryCards> LibraryCards { get; set; }
    }
}
