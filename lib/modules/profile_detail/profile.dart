import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pertemuan_v/models/user.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({
    super.key,
    required this.user,
  });
  final User user;

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isVisiblePassword = false;

  @override
  void initState() {
    // TODO: implement initState
    if (widget.user.name != "") {
      _nameController.text = widget.user.name;
    }
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          CircleAvatar(
  radius: 50,
  backgroundImage: NetworkImage(widget.user.photoUrl),
),

          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue.withAlpha(100),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.chevron_left_rounded,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Profile Detail",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        isDense: true,
                        label: const Text("Nama"),
                        suffixIcon: const Icon(Icons.abc_rounded),
                        hintText: "ex. Arif Lukman",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Nama wajib diisi";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: !isVisiblePassword,
                      decoration: InputDecoration(
                        isDense: true,
                        label: const Text("Password"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisiblePassword = !isVisiblePassword;
                            });
                          },
                          icon: Icon(
                            isVisiblePassword == false
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Password wajib diisi";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_formkey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Column(
                      children: const [
                        Text("SUKSES"),
                        Text(
                          "Data Berhasil diubah",
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(
                16,
                0,
                16,
                16,
              ),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
  child: Text(
    "SIMPAN",
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: "Open Sans",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
