import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_constants.dart';

/// A validated contact form. Since this portfolio has no backend, on
/// submit it opens the user's mail client with a pre-filled message —
/// swap [_submit] for an API/Firebase call later without touching the
/// rest of the widget.
class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _sending = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _sending = true);

    final subject = Uri.encodeComponent('Portfolio inquiry from ${_nameController.text}');
    final body = Uri.encodeComponent(
      '${_messageController.text}\n\n— ${_nameController.text} (${_emailController.text})',
    );
    final uri = Uri.parse('mailto:${AppConstants.email}?subject=$subject&body=$body');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }

    if (mounted) {
      setState(() => _sending = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Opening your mail app…')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Your Name', prefixIcon: Icon(Icons.person_outline)),
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter your name' : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(labelText: 'Your Email', prefixIcon: Icon(Icons.alternate_email)),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'Please enter your email';
              final ok = RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[\w\-]{2,4}$').hasMatch(v.trim());
              return ok ? null : 'Please enter a valid email';
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _messageController,
            maxLines: 5,
            decoration: const InputDecoration(labelText: 'Message', alignLabelWithHint: true),
            validator: (v) => (v == null || v.trim().length < 10) ? 'Message should be at least 10 characters' : null,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _sending ? null : _submit,
              icon: _sending
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                    )
                  : const Icon(Icons.send_outlined, size: 18),
              label: Text(_sending ? 'Opening…' : 'Send Message'),
            ),
          ),
        ],
      ),
    );
  }
}
