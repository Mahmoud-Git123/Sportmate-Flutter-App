import 'dart:math' as math;

class Matchmake {
    
    double? _winStreakMulti;
    double? _lossStreakMultil;
    double? _expectedResult;
    double? _elo;


    Matchmake(int winStreak, int lossStreak) {

        _winStreakMulti = 0;
        _lossStreakMultil = 0;
        _elo = 0;
        
        if (lossStreak > 1) {
            _lossStreakMultil = 0;
        }

        else if (winStreak > 1) {
            _winStreakMulti = winStreak == 2 ? 0.1 : winStreak == 3 ? 0.2 : 0.25;
        }

    }

    double findOpponent(){
        
        //finds and sets opponent (only needs to be done once per match, NOT per player)

        double opponentElo = 1; //PLACEGHOLDER UNTIL DB
        return opponentElo;

    }

    
    double expectedResultCalc(double opponentElo){

        double? eloDifference = _elo! - opponentElo;
        double? expectedResult = 1 / (math.pow(10, eloDifference / 400) + 1);

        return expectedResult;
    }

    double postGameEloCalc(String gameResult){

        double resultValue = gameResult == "win" ? 1 : gameResult == "draw" ? 0.5 : 0;

        double newElo = _elo! * (resultValue - _expectedResult!);
        // adds to elo gain / loss depending on streak 
        newElo += (newElo * _winStreakMulti!);
        newElo -= (newElo * _lossStreakMultil!);

        return newElo;
    }

    String newRank(double newElo){
        String newRank = newElo < 300 ? "Bronze" : newElo < 600 ? "Silver ": newElo < 900 ? "Gold" : newElo < 1200 ? "Platinum" : "Pro";
        return newRank;
    }

    // one player matchmakes and requests game form a user
    void doMatchmake(){ 

        double oppElo = findOpponent();
        _expectedResult = expectedResultCalc(oppElo);

    }

    // both players get a new rank and new elo
    List doGameOver(String gameResult) {

        double newElo = postGameEloCalc(gameResult);
        
        //returns newly calculated elo and rank
        return [newElo, newRank(newElo)];

    }

}