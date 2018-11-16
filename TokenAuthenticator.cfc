component output="false" displayname=""  {
    public function init(){
        return this;
    }
    public function authenticator(){
        var tokens = url.token.split("/key");
        var timestamp = tokens[1];
        var mykey = tokens[2];
        var decryptedTimestamp = decrypt(timestamp, mykey, "AES", "Base64")
        var userInfo = decryptedTimestamp.split("/");
        var username = userInfo[1];
        var dateToCheck = userInfo[2];
        var accept = DateValidate(dateToCheck);
        return username&":"&accept;
    }
    public function DateValidate(dateToCheck){
        var today = Now();
        var noOfHours = DateDiff("h", dateToCheck, today);
        if(noOfHours gt 24)
            return false;
        else
            return true;
    }
}
