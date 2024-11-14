import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  List<Map<String, String>> _tasks = [];
  final TextEditingController _taskController = TextEditingController();

  Future<void> _selectDateTime() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          String date = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
          String time = "${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}";
          _tasks.add({'task': _taskController.text, 'date': date, 'time': time});
          _taskController.clear();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB0B0B0),
      appBar: AppBar(
        title: const Text('Schedule', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2C5E50),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: 'Masukkan Kegiatan',
                labelStyle: const TextStyle(color: Colors.black54),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: _selectDateTime,
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text('Tambahkan Tanggal & Waktu', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2C5E50),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _tasks.isEmpty
                  ? const Center(
                      child: Text(
                        'Belum Ada Kegiatan.',
                        style: TextStyle(color: Colors.black54, fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _tasks.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            leading: const Icon(Icons.event_note, color: Color(0xFF2C5E50)),
                            title: Text(
                              _tasks[index]['task'] ?? '',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
                              '${_tasks[index]['date']} at ${_tasks[index]['time']}',
                              style: const TextStyle(color: Colors.black54),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.redAccent),
                              onPressed: () {
                                setState(() {
                                  _tasks.removeAt(index);
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
            bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF1E4D45),
        child: IconButton(
          icon: const Icon(Icons.home, color: Colors.yellow),
          onPressed: () {
            Navigator.pop(context); // Navigate back to home page
          },
        ),
      ),
    );
  }
}
