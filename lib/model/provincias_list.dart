class Provincias {
  Provincias({this.nome, this.value});

  String nome;
  String value;

  List<Provincias> todasProvincias() {
    List<Provincias> provincias = [
      new Provincias(nome: 'Luanda', value: 'Luanda'),
      new Provincias(nome: 'Bengo', value: 'Bengo'),
      new Provincias(nome: 'Benguela', value: 'Benguela'),
      new Provincias(nome: 'Moxico', value: 'Móxico'),
      new Provincias(nome: 'Uíge', value: 'Uíge'),
      new Provincias(nome: 'Huíla', value: 'Huíla'),
      new Provincias(nome: 'Cabinda', value: 'Cabinda'),
      new Provincias(nome: 'Lunda norte', value: 'Lunda-Norte'),
      new Provincias(nome: 'Lunda sul', value: 'Lunda-Sul'),
      new Provincias(nome: 'Kwanza norte', value: 'Cuanza-Norte'),
      new Provincias(nome: 'Kwanza sul', value: 'Cuanza-Sul'),
      new Provincias(nome: 'Bié', value: 'Bié'),
      new Provincias(nome: 'Cuando cubango', value: 'Cuando cubango'),
      new Provincias(nome: 'Malanje', value: 'Malanje'),
    ];

    // Ordena as províncias em ordem crescente
    provincias.sort((a, b) => a.nome.compareTo(b.nome));

    return provincias;
  }
}
