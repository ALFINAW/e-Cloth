import 'package:flutter/material.dart';

enum TrackingStatus { notStarted, inProgress, completed }

class PacketTracking extends StatelessWidget {
  const PacketTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            "Packet tracking",
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        Row(
          children: [
            _buildCircleAvatar(TrackingStatus.completed),
            Expanded(child: _buildTimelineSegment(TrackingStatus.completed)),
            _buildCircleAvatar(TrackingStatus.completed),
            Expanded(child: _buildTimelineSegment(TrackingStatus.inProgress)),
            _buildCircleAvatar(TrackingStatus.inProgress),
            Expanded(child: _buildTimelineSegment(TrackingStatus.notStarted)),
            _buildCircleAvatar(TrackingStatus.notStarted),
          ],
        ),
        const SizedBox(height: 24.0),
        const Text(
          "Your package is on it's way",
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4.0),
        const Text(
          "Arrival estimate: April 16, 07:00",
          style: TextStyle(
            fontSize: 13.0,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16.0),
        const TrackingStep(
          status: "Your package is at JNE BNA",
          date: "April 15, 12:05",
          trackingStatus: TrackingStatus.completed,
        ),
        const TrackingStep(
          status: "Your package is on route",
          date: "April 15, 09:25",
          trackingStatus: TrackingStatus.completed,
        ),
        const TrackingStep(
          status: "Your package left the distribution center Jakarta",
          date: "April 14, 04:47",
          trackingStatus: TrackingStatus.inProgress,
        ),
        const SizedBox(height: 15.0),
        const Divider(),
      ],
    );
  }

  Widget _buildTimelineSegment(TrackingStatus status) {
    Color color;
    switch (status) {
      case TrackingStatus.completed:
        color = Colors.deepPurple;
        break;
      case TrackingStatus.inProgress:
        color = Colors.deepPurple;
        break;
      case TrackingStatus.notStarted:
      default:
        color = Colors.deepPurple[100]!;
    }
    return Container(
      height: 2,
      color: color,
    );
  }

  Widget _buildCircleAvatar(TrackingStatus status) {
    switch (status) {
      case TrackingStatus.completed:
        return const CircleAvatar(
          radius: 8.0,
          backgroundColor: Colors.deepPurple,
        );
      case TrackingStatus.inProgress:
        return Container(
          width: 22.0,
          height: 22.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.deepPurple,
              width: 2.0,
            ),
          ),
          child: Center(
            child: Container(
              width: 14.0,
              height: 14.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurple,
              ),
            ),
          ),
        );
      case TrackingStatus.notStarted:
      default:
        return CircleAvatar(
          radius: 8.0,
          backgroundColor: Colors.deepPurple[100],
        );
    }
  }
}

class TrackingStep extends StatelessWidget {
  final String status;
  final String date;
  final TrackingStatus trackingStatus;

  const TrackingStep({
    super.key,
    required this.status,
    required this.date,
    required this.trackingStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            status,
            style: const TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            date,
            style: const TextStyle(
              fontSize: 11.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
