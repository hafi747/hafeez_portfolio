import 'package:flutter/material.dart';
import '../../domain/entities/skill_entity.dart';

/// Displays a skill icon/name with an animated horizontal proficiency
/// bar that fills up on first build.
class SkillProgressTile extends StatefulWidget {
  final SkillEntity skill;

  const SkillProgressTile({super.key, required this.skill});

  @override
  State<SkillProgressTile> createState() => _SkillProgressTileState();
}

class _SkillProgressTileState extends State<SkillProgressTile>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _value;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _value = Tween<double>(begin: 0, end: widget.skill.proficiency)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(widget.skill.icon, color: scheme.primary, size: 22),
              const SizedBox(width: 10),
              Expanded(
                child: Text(widget.skill.name, style: Theme.of(context).textTheme.titleMedium),
              ),
              AnimatedBuilder(
                animation: _value,
                builder: (context, _) => Text(
                  '${(_value.value * 100).round()}%',
                  style: TextStyle(color: scheme.onSurfaceVariant, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: AnimatedBuilder(
              animation: _value,
              builder: (context, _) => LinearProgressIndicator(
                value: _value.value,
                minHeight: 8,
                backgroundColor: scheme.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation(scheme.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
