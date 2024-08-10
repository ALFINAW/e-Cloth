import 'dart:math';

import 'package:flutter/material.dart';

class PackageTracking extends StatefulWidget {
  const PackageTracking({super.key});

  @override
  PackageTrackingState createState() => PackageTrackingState();
}

class PackageTrackingState extends State<PackageTracking> {
  bool isExpanded = false;

  final List<String> trackingSummary = [
    "Pick Up",
    "On Transit",
    "On Delivery",
    "Delivered"
  ];
  final List<TrackingStep> trackingSteps = [
    TrackingStep(
      title: "Order is processed",
      subtitle: "April 12, 07:00",
    ),
    TrackingStep(
      title: "Waiting for pick up",
      subtitle: "April 13, 10:00",
    ),
    TrackingStep(
      title: "Your package is left the distribution center jakarta",
      subtitle: "April 14, 04:47",
    ),
    TrackingStep(
      title: "Your package is on route",
      subtitle: "April 15, 09:25",
    ),
    TrackingStep(
      title: "Your package is at JNE Banjarnegara",
      subtitle: "April 15, 12:05",
    ),
    TrackingStep(
      title: "Your package is on its way",
      subtitle: "April 15, 07:00",
    ),
    TrackingStep(
      title: "Your package is arrived!!",
      subtitle: "Arrived: April 16, 09:00",
      isCurrentStep: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            "Packet Tracking",
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        _buildHorizontalTrackingIndicator(),
        const SizedBox(height: 30.0),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isExpanded ? null : (trackingSteps.length > 4 ? 185.0 : null),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: isExpanded
                ? trackingSteps.length
                : min(trackingSteps.length, 4),
            itemBuilder: (context, index) {
              final step = trackingSteps.reversed.toList()[index];
              final isLastItem = index == trackingSteps.length - 1;

              return IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      width: 10,
                      child: Column(
                        children: [
                          Container(
                            width: 10.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  step.isCurrentStep ? Colors.red : Colors.grey,
                            ),
                          ),
                          if (!isLastItem)
                            Expanded(
                              child: Container(
                                width: 2.0,
                                color: Colors.grey,
                              ),
                            ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12.0, left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              step.title,
                              style: TextStyle(
                                fontWeight: step.isCurrentStep
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            Text(
                              step.subtitle,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10.0),
        Center(
          child: Container(
            height: 25,
            padding: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: Colors.grey[900]!,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Icon(isExpanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalTrackingIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: trackingSummary.map((status) {
        int index = trackingSummary.indexOf(status);
        bool isCompleted =
            index <= trackingSteps.indexWhere((step) => step.isCurrentStep);

        return Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 2.0,
                      color: index == 0
                          ? Colors.transparent
                          : (isCompleted ? Colors.red : Colors.grey),
                    ),
                  ),
                  Container(
                    width: 15.0,
                    height: 15.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isCompleted ? Colors.red : Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 2.0,
                      color: index == trackingSummary.length - 1
                          ? Colors.transparent
                          : (isCompleted ? Colors.red : Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
              Text(
                status,
                style: TextStyle(
                  fontSize: 12.0,
                  color: isCompleted ? Colors.black : Colors.grey,
                  fontWeight: isCompleted ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class TrackingStep {
  final String title;
  final String subtitle;
  final bool isCurrentStep;

  TrackingStep({
    required this.title,
    required this.subtitle,
    this.isCurrentStep = false,
  });
}
