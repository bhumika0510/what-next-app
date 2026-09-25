<%@    page    import="java.net.*"     %> 
<%@    page    import="java.io.*"     %>
<%@    page    import="org.json.*"     %>


<html>
     <head>
            <title>
                     Motivational Msg App By Bhumika
            </title>
            <style>
                     *{font-size:40px;         text-align:center;       font-family:Cambria; }
                     body{background-color:lightblue;}
            </style>
     </head>
     <body>
              <h1>Motivational App</h1>
            <form>
              <input type="submit"   name="btn"   value="Show Message" />
            </form>
            <%

                 if(request.getParameter("btn") != null)
                 {
                     try{
                           String apiUrl = ""htpps://";
                           URI uri = URI.create(apiUrl);
                           URL url = uri.toURL();
                           HttpURLConnection con = (HttpURLConnection)url.openConnection();
                           con.setRequestMethod("GET");
                           InputStreamReader isr = new InputStreamReader(con.getInputStream());
                           BufferedReader br = new BufferedReader(isr);
                           String jsonData = "";
                           String line = br.readLine();
                           while(line != null){
                                     jsonData = jsonData + line;
                                     line = br.readLine();
                           }
                         
                           JSONObject jo = new JSONObject(jsonData);
                           JSONObject rates = jo.getJSONObject("rates");
                           double VALUE = rates.getDouble(to);

                           double res = amt * VALUE;
                           String msg = String.format("%.2f",res);
                           out.println(msg);

                     } catch(NumberFormatException e){
                           out.println("amt shud be in numbers only");
                     } catch(Exception e){
                           out.println("issue" + e);
                     }
                 }
            %>
        </body>
</html>