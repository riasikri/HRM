package com.user.geozoneService

import grails.transaction.Transactional

@Transactional
class GeogoneService {





    public static String isInside(double rad, double lat2, double lon2, double lat1, double lon1) {

        double R = 6371e3; // metres
        double a1 = Math.toRadians(lat1);
        double a2 = Math.toRadians(lat2);
        double a = Math.toRadians((lat2 - lat1));
        double b = Math.toRadians((lon2 - lon1));

        double c = Math.sin(a / 2) * Math.sin(a / 2) +
                Math.cos(a1) * Math.cos(a2) *
                Math.sin(b / 2) * Math.sin(b / 2);
        double d = 2 * Math.atan2(Math.sqrt(c), Math.sqrt(1 - c));

        double e = R * d;
        if (e <= rad) {
            return "in";
        } else {
            return "out";
        }


    }

     Object[] appendValue(Object[] obj, Object newObj) {

        ArrayList<Object> temp = new ArrayList<Object>(Arrays.asList(obj));
        temp.add(newObj);
        return temp.toArray();

    }

}