class Student {
  final String name;
  final String course;
  // Adicione mais propriedades do aluno aqui

  Student({
    required this.name,
    required this.course,
    // Inicialize as propriedades adicionais aqui
  });
}

Student currentStudent = Student(
  name: 'Nome do Aluno',
  course: 'Curso do Aluno',
  // Preencha as propriedades adicionais aqui
);
