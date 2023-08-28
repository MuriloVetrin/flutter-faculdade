class Book {
  final String title;
  final String author;
  final String publisher;

  Book({
    required this.title,
    required this.author,
    required this.publisher,
  });
}

List<Book> books = [
  Book(
    title: 'Livro 1',
    author: 'Autor 1',
    publisher: 'Editora 1',
  ),
  Book(
    title: 'Livro 2',
    author: 'Autor 2',
    publisher: 'Editora 2',
  ),
  // Adicione mais livros aqui
];
