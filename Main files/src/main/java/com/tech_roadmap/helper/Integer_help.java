package com.tech_roadmap.helper;

public class Integer_help {

    public static int convert(String c){
        int answer = 0, factor = 1;

        try{
            for (int i = c.length()-1; i >= 0; i--) {
                answer += (c.charAt(i) - '0') * factor;
                factor *= 10;
            }
            return answer;

        }catch (NumberFormatException e){
            answer=0;
        }

        return answer;
    }

}
