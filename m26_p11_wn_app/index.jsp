<%@         page    import="java.sql.*"             %>
<html>
       <head>
              <title>
                        What Next APP
              </title>
              <style>
                      *{
                         font-size: 40px;
                         text-align:center;
                         font-family: Calibri;
                       }
                       body{
                              background-color:lightyellow;
                       }
                       input[type=radio]{
                               height:0.6em;
                               width:1.5%;
                               margin-left:2%;
                       }
              </style>
       </head>
       <body>
              <h1> What Next APP </h1>
              <form>
                     <label>Name</label>
                     <br/>
                     <input type="text"     name="name" 
                      placeholder="Enter Your Name"/>
                     <br><br>
                     <label>Select One</label>
                     <br>
                     <input type="radio"    name="choice"    value="job" checked=true/>Job
                     <input type="radio"    name="choice"    value="ms"/>MS
                     <input type="radio"    name="choice"    value="mba"/>MBA
                     <br><br>
                     <input type="submit"   name="btn"/>
              </form>
              <%
                    if(request.getParameter("btn") != null)
                    {
                          String msg="";
                          String name = request.getParameter("name");
                          if(name.isBlank())
                          {
                                msg="name is empty";
                                out.println(msg);
                                return;
                          }

                          String choice = request.getParameter("choice");
                          Connection con = null;
                          try{
                          DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                          
                          String url ="jdbc:mysql://localhost:3308/student";
                          con = DriverManager.getConnection(url,"your_username","your_password");
                   
                          String sql = "insert into student(name, choice) values(?,?)";
                          PreparedStatement pst = con.prepareStatement(sql);
                          pst.setString(1,name);
                          pst.setString(2,choice);
                          pst.executeUpdate();
                          out.println("Ok Thanks");
                          } catch(SQLException e){
                           msg = "issue "    + e;
                           out.println(msg);
                          } finally{
                              try{
                                  con.close();
                                  } catch(SQLException e){
                                       msg= "close issue"+e;
                                        out.println(msg);
                                  }
                           }

                    }
               %>
       </body>
</html>