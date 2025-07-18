import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PremiumSection extends StatelessWidget {
  final List<Map<String, dynamic>> listings;
  final Function(Map<String, dynamic>) onTap;
  final Set<String> favoriteIds;
  final Function(String) onFavoriteToggle;
  
  const PremiumSection({
    required this.listings,
    required this.onTap,
    required this.favoriteIds,
    required this.onFavoriteToggle,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      margin: EdgeInsets.only(bottom: 2.h),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        itemCount: listings.length,
        itemBuilder: (_, index) => Container(
          width: 85.w,
          margin: EdgeInsets.only(right: 3.w),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => onTap(listings[index]),
              child: Padding(
                padding: EdgeInsets.all(3.w),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        listings[index]['image'],
                        width: 120,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          width: 120,
                          height: double.infinity,
                          color: Colors.grey[300],
                          child: Icon(Icons.image, color: Colors.grey[600], size: 40),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Color(0xFF2563EB), Color(0xFF0EA5E9)],
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.star, color: Colors.white, size: 14),
                                    SizedBox(width: 4),
                                    Text('Premium', 
                                      style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                listings[index]['title'],
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4),
                              Text(
                                listings[index]['description'] ?? '',
                                style: TextStyle(color: Colors.grey[600], fontSize: 12),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '₹${listings[index]['price']}',
                                style: TextStyle(color: Color(0xFF2563EB), fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined, size: 14, color: Colors.grey[600]),
                                  SizedBox(width: 4),
                                  Flexible(
                                    child: Text(
                                      listings[index]['location'],
                                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            favoriteIds.contains(listings[index]['id']) ? Icons.favorite : Icons.favorite_border,
                            color: Color(0xFF2563EB),
                          ),
                          onPressed: () => onFavoriteToggle(listings[index]['id']),
                        ),
                        Text(
                          listings[index]['time_ago'],
                          style: TextStyle(color: Colors.grey[600], fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}