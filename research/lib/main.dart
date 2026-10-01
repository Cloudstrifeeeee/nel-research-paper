import 'package:flutter/material.dart';

void main() {
  runApp(const RegistrarApp());
}

class RegistrarApp extends StatelessWidget {
  const RegistrarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Registrar's Office",
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF9B111E),
        ),
      ),
      home: const RegistrarDashboard(),
    );
  }
}

class RegistrarDashboard extends StatefulWidget {
  const RegistrarDashboard({super.key});

  @override
  State<RegistrarDashboard> createState() => _RegistrarDashboardState();
}

class _RegistrarDashboardState extends State<RegistrarDashboard> {
  int selectedPage = 0;

  final Color darkRed = const Color(0xFF7A1010);
  final Color red = const Color(0xFFB71C1C);
  final Color lightRed = const Color(0xFFFCECEC);

  final List<String> menuItems = [
    "Dashboard",
    "Queue Management",
    "Appointment Management",
    "Student Records",
    "Service Management",
    "Schedule / Time Slots",
    "Reports & Statistics",
    "User Management",
    "Settings",
  ];

  final List<IconData> menuIcons = [
    Icons.dashboard_outlined,
    Icons.people_alt_outlined,
    Icons.calendar_month_outlined,
    Icons.badge_outlined,
    Icons.miscellaneous_services_outlined,
    Icons.schedule_outlined,
    Icons.bar_chart_outlined,
    Icons.manage_accounts_outlined,
    Icons.settings_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      body: Row(
        children: [
          _buildSidebar(),
          Expanded(
            child: Column(
              children: [
                _buildTopBar(),
                Expanded(
                  child: _buildCurrentPage(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SIDEBAR
  // ============================================================

  Widget _buildSidebar() {
    return Container(
      width: 245,
      color: darkRed,
      child: Column(
        children: [
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.account_balance,
                    color: darkRed,
                    size: 27,
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    "REGISTRAR'S\nOFFICE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final selected = selectedPage == index;

                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedPage = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: selected ? red : Colors.transparent,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          menuIcons[index],
                          color: Colors.white,
                          size: 19,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            menuItems[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.black.withOpacity(.12),
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Color(0xFF8B1111),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Maria Santos",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Registrar Staff",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // TOP BAR
  // ============================================================

  Widget _buildTopBar() {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE5E5E5),
          ),
        ),
      ),
      child: Row(
        children: [
          Text(
            menuItems[selectedPage],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
          const SizedBox(width: 10),
          const CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xFFF5D5D5),
            child: Icon(
              Icons.person,
              color: Color(0xFF9B111E),
              size: 20,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            "Maria Santos",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          const SizedBox(width: 5),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }

  // ============================================================
  // PAGE SWITCHER
  // ============================================================

  Widget _buildCurrentPage() {
    switch (selectedPage) {
      case 0:
        return _dashboardPage();
      case 1:
        return _queuePage();
      case 2:
        return _appointmentPage();
      case 3:
        return _studentRecordsPage();
      case 4:
        return _servicesPage();
      case 5:
        return _schedulePage();
      case 6:
        return _reportsPage();
      case 7:
        return _usersPage();
      case 8:
        return _settingsPage();
      default:
        return _dashboardPage();
    }
  }

  // ============================================================
  // DASHBOARD
  // ============================================================

  Widget _dashboardPage() {
    return _pageBody(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _pageTitle(
            "Registrar Dashboard",
            "Overview of today's registrar operations.",
          ),

          const SizedBox(height: 22),

          Row(
            children: [
              Expanded(
                child: _statCard(
                  "Today's Appointments",
                  "18",
                  Icons.calendar_today_outlined,
                  Colors.red.shade50,
                  red,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _statCard(
                  "Current Queue",
                  "A-023",
                  Icons.confirmation_number_outlined,
                  Colors.orange.shade50,
                  Colors.orange.shade800,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _statCard(
                  "Waiting Students",
                  "7",
                  Icons.people_outline,
                  Colors.amber.shade50,
                  Colors.orange.shade700,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _statCard(
                  "Completed Today",
                  "25",
                  Icons.check_circle_outline,
                  Colors.green.shade50,
                  Colors.green.shade700,
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: _queueActivity(),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _quickActions(),
              ),
            ],
          ),

          const SizedBox(height: 22),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _appointmentPreview(),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _servicePreview(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statCard(
    String title,
    String value,
    IconData icon,
    Color background,
    Color iconColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _boxDecoration(),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _queueActivity() {
    final data = [
      ["A-021", "Transcript of Records", "Processing", "09:01 AM"],
      ["A-022", "Certificate", "Completed", "09:16 AM"],
      ["A-023", "Enrollment Concern", "Waiting", "09:21 AM"],
      ["A-024", "Student Records", "Waiting", "09:35 AM"],
      ["A-025", "Certificate", "Waiting", "09:44 AM"],
    ];

    return _panel(
      "Recent Queue Activity",
      Column(
        children: [
          _tableHeader([
            "Queue #",
            "Service",
            "Status",
            "Time",
          ]),
          const Divider(),
          ...data.map(
            (row) => _tableRow(row),
          ),
        ],
      ),
    );
  }

  Widget _quickActions() {
    return _panel(
      "Quick Actions",
      Column(
        children: [
          _actionButton(
            "Call Next Student",
            Icons.campaign_outlined,
            () {},
          ),
          _actionButton(
            "Add Appointment",
            Icons.add_box_outlined,
            () => setState(() => selectedPage = 2),
          ),
          _actionButton(
            "Manage Queue",
            Icons.people_outline,
            () => setState(() => selectedPage = 1),
          ),
          _actionButton(
            "View Reports",
            Icons.bar_chart_outlined,
            () => setState(() => selectedPage = 6),
          ),
        ],
      ),
    );
  }

  Widget _appointmentPreview() {
    final data = [
      ["09:00 AM", "Juan Dela Cruz", "Transcript", "Confirmed"],
      ["09:30 AM", "Maria Garcia", "Certificate", "Confirmed"],
      ["10:00 AM", "Mark Santos", "Student Records", "Pending"],
      ["10:30 AM", "Ana Reyes", "Enrollment", "Confirmed"],
    ];

    return _panel(
      "Today's Appointments",
      Column(
        children: [
          _tableHeader([
            "Time",
            "Student",
            "Service",
            "Status",
          ]),
          const Divider(),
          ...data.map((row) => _tableRow(row)),
        ],
      ),
    );
  }

  Widget _servicePreview() {
    final services = [
      "Transcript of Records",
      "Certificate Request",
      "Enrollment Concern",
      "Student Records",
    ];

    return _panel(
      "Registrar Services",
      Column(
        children: services.map((service) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 17,
              backgroundColor: lightRed,
              child: Icon(
                Icons.description_outlined,
                color: red,
                size: 18,
              ),
            ),
            title: Text(
              service,
              style: const TextStyle(fontSize: 12),
            ),
            trailing: _statusBadge("Active"),
          );
        }).toList(),
      ),
    );
  }

  // ============================================================
  // QUEUE MANAGEMENT
  // ============================================================

  Widget _queuePage() {
    final queues = [
      ["A-021", "Juan Dela Cruz", "Transcript of Records", "Processing"],
      ["A-022", "Maria Garcia", "Certificate Request", "Completed"],
      ["A-023", "Mark Santos", "Enrollment Concern", "Waiting"],
      ["A-024", "Ana Reyes", "Student Records", "Waiting"],
      ["A-025", "John Cruz", "Certificate Request", "Waiting"],
      ["A-026", "Carla Mendoza", "Transcript of Records", "Waiting"],
    ];

    return _pageBody(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _pageTitle(
            "Queue Management",
            "Manage and monitor students currently in the queue.",
          ),
          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: _statCard(
                  "Waiting",
                  "7",
                  Icons.hourglass_empty,
                  Colors.orange.shade50,
                  Colors.orange,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _statCard(
                  "Currently Serving",
                  "A-021",
                  Icons.person_pin,
                  lightRed,
                  red,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _statCard(
                  "Completed",
                  "25",
                  Icons.check_circle_outline,
                  Colors.green.shade50,
                  Colors.green,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          _panel(
            "Current Queue",
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _searchBox("Search queue number or student"),
                    ),
                    const SizedBox(width: 12),
                    _redButton(
                      "Call Next",
                      Icons.campaign_outlined,
                      () {},
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _queueTable(queues),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _queueTable(List<List<String>> queues) {
    return Column(
      children: [
        _tableHeader([
          "Queue #",
          "Student",
          "Service",
          "Status",
          "Action",
        ]),
        const Divider(),
        ...queues.map(
          (row) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 11),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    row[0],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(row[1]),
                ),
                Expanded(
                  flex: 2,
                  child: Text(row[2]),
                ),
                Expanded(
                  child: _statusBadge(row[3]),
                ),
                Expanded(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.campaign_outlined,
                          size: 18,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.check_circle_outline,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // APPOINTMENTS
  // ============================================================

  Widget _appointmentPage() {
    final appointments = [
      ["09:00 AM", "Juan Dela Cruz", "2026-10-01", "Transcript", "Confirmed"],
      ["09:30 AM", "Maria Garcia", "2026-10-01", "Certificate", "Confirmed"],
      ["10:00 AM", "Mark Santos", "2026-10-01", "Student Records", "Pending"],
      ["10:30 AM", "Ana Reyes", "2026-10-01", "Enrollment", "Confirmed"],
      ["11:00 AM", "John Cruz", "2026-10-01", "Certificate", "Pending"],
    ];

    return _pageBody(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _pageTitle(
            "Appointment Management",
            "Create, view, and manage student appointments.",
          ),
          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: _searchBox("Search student or appointment"),
              ),
              const SizedBox(width: 12),
              _redButton(
                "Add Appointment",
                Icons.add,
                () {},
              ),
            ],
          ),

          const SizedBox(height: 20),

          _panel(
            "Appointment List",
            Column(
              children: [
                _tableHeader([
                  "Time",
                  "Student",
                  "Date",
                  "Service",
                  "Status",
                  "Actions",
                ]),
                const Divider(),
                ...appointments.map(
                  (row) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Expanded(child: Text(row[0])),
                        Expanded(flex: 2, child: Text(row[1])),
                        Expanded(child: Text(row[2])),
                        Expanded(flex: 2, child: Text(row[3])),
                        Expanded(child: _statusBadge(row[4])),
                        Expanded(
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete_outline,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // STUDENT RECORDS
  // ============================================================

  Widget _studentRecordsPage() {
    final students = [
      ["2026-00123", "Juan Dela Cruz", "BSIT", "3rd Year", "Active"],
      ["2026-00124", "Maria Garcia", "BSBA", "2nd Year", "Active"],
      ["2026-00125", "Mark Santos", "BSCS", "4th Year", "Active"],
      ["2026-00126", "Ana Reyes", "BSED", "1st Year", "Active"],
      ["2026-00127", "John Cruz", "BSIT", "3rd Year", "Inactive"],
    ];

    return _pageBody(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _pageTitle(
            "Student Records",
            "View and manage student information and transaction history.",
          ),
          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: _searchBox("Search student ID or name"),
              ),
              const SizedBox(width: 12),
              _redButton(
                "Add Student",
                Icons.person_add_outlined,
                () {},
              ),
            ],
          ),

          const SizedBox(height: 20),

          _panel(
            "Student Directory",
            Column(
              children: [
                _tableHeader([
                  "Student ID",
                  "Name",
                  "Program",
                  "Year",
                  "Status",
                  "Action",
                ]),
                const Divider(),
                ...students.map(
                  (row) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Expanded(child: Text(row[0])),
                        Expanded(flex: 2, child: Text(row[1])),
                        Expanded(child: Text(row[2])),
                        Expanded(child: Text(row[3])),
                        Expanded(child: _statusBadge(row[4])),
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text("View"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SERVICES
  // ============================================================

  Widget _servicesPage() {
    final services = [
      ["Transcript of Records", "Document Request", "15 min", "Active"],
      ["Certificate Request", "Document Request", "10 min", "Active"],
      ["Enrollment Concern", "Student Concern", "20 min", "Active"],
      ["Student Records", "Records", "15 min", "Active"],
      ["Other Registrar Services", "General", "20 min", "Inactive"],
    ];

    return _pageBody(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _pageTitle(
            "Service Management",
            "Manage the registrar services available to students.",
          ),
          const SizedBox(height: 20),

          Align(
            alignment: Alignment.centerRight,
            child: _redButton(
              "Add Service",
              Icons.add,
              () {},
            ),
          ),

          const SizedBox(height: 20),

          _panel(
            "Registrar Services",
            Column(
              children: [
                _tableHeader([
                  "Service",
                  "Category",
                  "Estimated Time",
                  "Status",
                  "Actions",
                ]),
                const Divider(),
                ...services.map(
                  (row) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Expanded(flex: 2, child: Text(row[0])),
                        Expanded(child: Text(row[1])),
                        Expanded(child: Text(row[2])),
                        Expanded(child: _statusBadge(row[3])),
                        Expanded(
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete_outline,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SCHEDULE
  // ============================================================

  Widget _schedulePage() {
    final schedules = [
      ["Monday", "08:00 AM", "05:00 PM", "Open"],
      ["Tuesday", "08:00 AM", "05:00 PM", "Open"],
      ["Wednesday", "08:00 AM", "05:00 PM", "Open"],
      ["Thursday", "08:00 AM", "05:00 PM", "Open"],
      ["Friday", "08:00 AM", "04:00 PM", "Open"],
    ];

    return _pageBody(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _pageTitle(
            "Schedule / Time Slots",
            "Manage registrar office operating hours and appointment slots.",
          ),
          const SizedBox(height: 20),

          Align(
            alignment: Alignment.centerRight,
            child: _redButton(
              "Add Time Slot",
              Icons.add,
              () {},
            ),
          ),

          const SizedBox(height: 20),

          _panel(
            "Office Schedule",
            Column(
              children: [
                _tableHeader([
                  "Day",
                  "Opening Time",
                  "Closing Time",
                  "Status",
                  "Actions",
                ]),
                const Divider(),
                ...schedules.map(
                  (row) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            row[0],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(child: Text(row[1])),
                        Expanded(child: Text(row[2])),
                        Expanded(
                          child: _statusBadge(row[3]),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit_outlined,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          _panel(
            "Today's Available Time Slots",
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                "08:00 AM",
                "08:30 AM",
                "09:00 AM",
                "09:30 AM",
                "10:00 AM",
                "10:30 AM",
                "11:00 AM",
                "11:30 AM",
                "01:00 PM",
                "01:30 PM",
                "02:00 PM",
                "02:30 PM",
              ].map((time) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: lightRed,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.red.shade100,
                    ),
                  ),
                  child: Text(
                    time,
                    style: TextStyle(
                      color: red,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // REPORTS
  // ============================================================

  Widget _reportsPage() {
    return _pageBody(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _pageTitle(
            "Reports & Statistics",
            "View transaction, appointment, and service statistics.",
          ),
          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: _statCard(
                  "Total Transactions",
                  "342",
                  Icons.receipt_long_outlined,
                  lightRed,
                  red,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _statCard(
                  "Appointments",
                  "118",
                  Icons.calendar_month_outlined,
                  Colors.blue.shade50,
                  Colors.blue,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _statCard(
                  "Completed",
                  "298",
                  Icons.check_circle_outline,
                  Colors.green.shade50,
                  Colors.green,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _statCard(
                  "Cancelled",
                  "12",
                  Icons.cancel_outlined,
                  Colors.orange.shade50,
                  Colors.orange,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _panel(
                  "Transactions by Service",
                  Column(
                    children: [
                      _progressRow("Transcript of Records", 0.75, "128"),
                      _progressRow("Certificate Request", 0.58, "96"),
                      _progressRow("Student Records", 0.42, "71"),
                      _progressRow("Enrollment Concern", 0.28, "47"),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _panel(
                  "Report Actions",
                  Column(
                    children: [
                      _actionButton(
                        "Generate Daily Report",
                        Icons.today_outlined,
                        () {},
                      ),
                      _actionButton(
                        "Generate Monthly Report",
                        Icons.calendar_month_outlined,
                        () {},
                      ),
                      _actionButton(
                        "Export Transactions",
                        Icons.download_outlined,
                        () {},
                      ),
                      _actionButton(
                        "Print Report",
                        Icons.print_outlined,
                        () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _progressRow(
    String label,
    double value,
    String number,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              Text(
                number,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: value,
              minHeight: 8,
              backgroundColor: Colors.grey.shade200,
              color: red,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // USER MANAGEMENT
  // ============================================================

  Widget _usersPage() {
    final users = [
      ["ADM-001", "Maria Santos", "Registrar Staff", "Active"],
      ["ADM-002", "Pedro Reyes", "Registrar Staff", "Active"],
      ["ADM-003", "Ana Garcia", "Administrator", "Active"],
      ["USR-004", "John Cruz", "Staff", "Inactive"],
    ];

    return _pageBody(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _pageTitle(
            "User Management",
            "Manage registrar staff and administrator accounts.",
          ),
          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: _searchBox("Search user"),
              ),
              const SizedBox(width: 12),
              _redButton(
                "Create Account",
                Icons.person_add_outlined,
                () {},
              ),
            ],
          ),

          const SizedBox(height: 20),

          _panel(
            "User Accounts",
            Column(
              children: [
                _tableHeader([
                  "User ID",
                  "Name",
                  "Role",
                  "Status",
                  "Actions",
                ]),
                const Divider(),
                ...users.map(
                  (row) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Expanded(child: Text(row[0])),
                        Expanded(flex: 2, child: Text(row[1])),
                        Expanded(child: Text(row[2])),
                        Expanded(child: _statusBadge(row[3])),
                        Expanded(
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.lock_outline,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SETTINGS
  // ============================================================

  Widget _settingsPage() {
    return _pageBody(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _pageTitle(
            "Settings",
            "Configure system and registrar office preferences.",
          ),
          const SizedBox(height: 20),

          _panel(
            "Office Information",
            Column(
              children: [
                _settingField(
                  "Office Name",
                  "Registrar's Office",
                  Icons.business_outlined,
                ),
                _settingField(
                  "Contact Number",
                  "(02) 1234-5678",
                  Icons.phone_outlined,
                ),
                _settingField(
                  "Email Address",
                  "registrar@school.edu.ph",
                  Icons.email_outlined,
                ),
                _settingField(
                  "Office Location",
                  "Main Administration Building",
                  Icons.location_on_outlined,
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          _panel(
            "System Preferences",
            Column(
              children: [
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Enable Online Appointments",
                    style: TextStyle(fontSize: 13),
                  ),
                  subtitle: const Text(
                    "Allow students to book appointments online.",
                    style: TextStyle(fontSize: 11),
                  ),
                  value: true,
                  activeColor: red,
                  onChanged: (value) {},
                ),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Queue Notifications",
                    style: TextStyle(fontSize: 13),
                  ),
                  subtitle: const Text(
                    "Notify students when their queue number is near.",
                    style: TextStyle(fontSize: 11),
                  ),
                  value: true,
                  activeColor: red,
                  onChanged: (value) {},
                ),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Email Notifications",
                    style: TextStyle(fontSize: 13),
                  ),
                  subtitle: const Text(
                    "Send appointment confirmations by email.",
                    style: TextStyle(fontSize: 11),
                  ),
                  value: false,
                  activeColor: red,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Align(
            alignment: Alignment.centerRight,
            child: _redButton(
              "Save Changes",
              Icons.save_outlined,
              () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Settings saved successfully."),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _settingField(
    String label,
    String value,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: TextEditingController(text: value),
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  // ============================================================
  // GENERAL UI COMPONENTS
  // ============================================================

  Widget _pageBody(Widget child) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(25),
      child: child,
    );
  }

  Widget _pageTitle(
    String title,
    String subtitle,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _panel(
    String title,
    Widget child,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(19),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 17),
          child,
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: const Color(0xFFE5E5E5),
      ),
    );
  }

  Widget _tableHeader(List<String> headers) {
    return Row(
      children: headers.map((header) {
        return Expanded(
          flex: header == "Student" ||
                  header == "Service" ||
                  header == "Name"
              ? 2
              : 1,
          child: Text(
            header,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _tableRow(List<String> values) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: values.map((value) {
          return Expanded(
            flex: value.length > 15 ? 2 : 1,
            child: value == "Active" ||
                    value == "Inactive" ||
                    value == "Completed" ||
                    value == "Confirmed" ||
                    value == "Pending" ||
                    value == "Waiting" ||
                    value == "Processing"
                ? _statusBadge(value)
                : Text(
                    value,
                    style: const TextStyle(fontSize: 11),
                  ),
          );
        }).toList(),
      ),
    );
  }

  Widget _statusBadge(String status) {
    Color background;
    Color foreground;

    switch (status) {
      case "Active":
      case "Completed":
      case "Confirmed":
      case "Open":
        background = Colors.green.shade50;
        foreground = Colors.green.shade700;
        break;

      case "Processing":
        background = Colors.blue.shade50;
        foreground = Colors.blue.shade700;
        break;

      case "Pending":
      case "Waiting":
        background = Colors.orange.shade50;
        foreground = Colors.orange.shade800;
        break;

      case "Inactive":
        background = Colors.grey.shade200;
        foreground = Colors.grey.shade700;
        break;

      default:
        background = Colors.grey.shade100;
        foreground = Colors.grey.shade700;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: foreground,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _actionButton(
    String text,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: red,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 13),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
    );
  }

  Widget _redButton(
    String text,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 17),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: red,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }

  Widget _searchBox(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 12),
        prefixIcon: const Icon(Icons.search, size: 20),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFFE0E0E0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFFE0E0E0),
          ),
        ),
      ),
    );
  }
}