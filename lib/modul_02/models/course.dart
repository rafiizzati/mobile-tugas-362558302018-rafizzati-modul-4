class Course {
  final String code;
  final String name;
  final int sks;
  final double progress;
  final String room;
  final String waktu;
  final String status;
  final String note;

  const Course({
    required this.code,
    required this.name,
    required this.sks,
    required this.progress,
    this.room = 'Lab Komputer 3',
    this.waktu = '',
    this.status = 'Akan datang',
    this.note = '',
  });

  static List<Course> getSampleCourses() {
    return const [
      Course(
        code: 'TRPL501',
        name: 'Mobile Programming',
        sks: 4,
        progress: 0.25,
        room: 'Lab 1',
        waktu: '08.00 – 10.00',
        status: 'Berlangsung',
        note: 'Sedang digunakan oleh praktikan',
      ),
      Course(
        code: 'TRPL502',
        name: 'Rekayasa Perangkat Lunak',
        sks: 3,
        progress: 0.50,
        room: 'Lab 2',
        waktu: '10.00 – 12.00',
        status: 'Akan datang',
        note: 'Sesi akan dimulai sebentar lagi',
      ),
      Course(
        code: 'TRPL503',
        name: 'Basis Data',
        sks: 3,
        progress: 1.0,
        room: 'Lab 3',
        waktu: '13.00 – 15.00',
        status: 'Selesai',
        note: 'Sesi telah selesai',
      ),
    ];
  }
}