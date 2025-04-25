using BibliotecART.Connection;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace BibliotecART.Pages
{
    public partial class SearchPage : Page
    {
        public SearchPage()
        {
            InitializeComponent();
            LoadAllBooks();
        }

        private void LoadAllBooks()
        {
            BooksList.ItemsSource = DB.BIB.Books.ToList();
        }

        private void Search_Click(object sender, RoutedEventArgs e)
        {
            var searchText = SearchBox.Text.ToLower();
            BooksList.ItemsSource = DB.BIB.Books
                .Where(b => b.Title.ToLower().Contains(searchText))
                .ToList();
        }

        //private void FilterByDate_Click(object sender, RoutedEventArgs e)
        //{
        //    if (FromDate.SelectedDate == null || ToDate.SelectedDate == null)
        //    {
        //        MessageBox.Show("Выберите обе даты");
        //        return;
        //    }

        //    BooksList.ItemsSource = DB.BIB.Books
        //        .Where(b => b.YearPublished >= FromDate.SelectedDate.Value.Year &&
        //                    b.YearPublished <= ToDate.SelectedDate.Value.Year)
        //        .ToList();
        //}

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}