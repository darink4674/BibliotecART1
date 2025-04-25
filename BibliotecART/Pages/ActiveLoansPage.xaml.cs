using BibliotecART.Connection;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace BibliotecART.Pages
{
    public partial class ActiveLoansPage : Page
    {
        public ActiveLoansPage()
        {
            InitializeComponent();
            LoadActiveLoans();
        }

        private void LoadActiveLoans()
        {
            var activeLoans = DB.BIB.BookLoans
                .Where(bl => bl.Status == "На руках" || bl.Status == "Просрочена")
                .ToList()
                .Select(bl => new
                {
                    ReaderFullName = $"{bl.LibraryCards.Readers.FirstName} {bl.LibraryCards.Readers.LastName}",
                    bl.LibraryCards.Readers.Phone,
                    bl.LibraryCards.Readers.Email,
                    BookTitle = bl.Books.Title,
                    bl.LoanDate,
                    ReturnDate = bl.ReturnDate ?? bl.LoanDate.AddDays(14), // Показываем расчетную дату если NULL
                    Status = GetLoanStatus(bl) // Определяем статус
                })
                .OrderBy(x => x.Status) // Сначала просроченные
                .ToList();

            ActiveLoansList.ItemsSource = activeLoans;
        }

        private string GetLoanStatus(BookLoans loan)
        {
            if (loan.Status == "Просрочена")
                return "Просрочена";

            var returnDate = loan.ReturnDate ?? loan.LoanDate.AddDays(14);
            return returnDate < DateTime.Today ? "Просрочена" : "На руках";
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}