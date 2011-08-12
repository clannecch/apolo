@menu = Menu.all

=begin
<% if (Model.Menu != null) { %>
<div id="menu">
    <ul class="menu">
    <% foreach (APSWeb.Models.MenuModel Level0 in APSWeb.Models.GeneralUtitilies.GetSubMenues(Model.Menu, 1)) { %>
        <li><a class="parent" href="<%= (Level0.LinkUrlMVC.Trim() == "?" ? "/Home/MenuNavigation?id=" + Level0.ID.ToString() : Level0.LinkUrlMVC) %>"><span><%= Level0.Detalle %></span></a>
        <% if ( APSWeb.Models.GeneralUtitilies.GetSubMenues(Model.Menu, Level0.ID).Count > 0) { %>
            <%-- SEGUNDO NIVEL --%>
            <div><ul>
            <% foreach (APSWeb.Models.MenuModel Level1 in APSWeb.Models.GeneralUtitilies.GetSubMenues(Model.Menu, Level0.ID)) { %>
                <% if (Level1.LinkUrlMVC.Trim().Length > 0) { %>
                    <% if ( APSWeb.Models.GeneralUtitilies.GetSubMenues(Model.Menu, Level1.ID).Count == 0) { %>
                <li><a href="<%= Level1.LinkUrlMVC %>"><span><%= Level1.Detalle%></span></a></li>
                    <% } else { %>
                <li><a class="parent" href="<%= (Level1.LinkUrlMVC.Trim() == "?" ? "/Home/MenuNavigation?id=" + Level1.ID.ToString() : Level1.LinkUrlMVC) %>"><span><%= Level1.Detalle %></span></a>
                    <%-- TERCER NIVEL --%>
                    <div><ul>
                        <% foreach (APSWeb.Models.MenuModel Level2 in APSWeb.Models.GeneralUtitilies.GetSubMenues(Model.Menu, Level1.ID)) { %>
                            <% if (Level2.LinkUrlMVC.Trim().Length > 1) { %>
                                <% if ( APSWeb.Models.GeneralUtitilies.GetSubMenues(Model.Menu, Level2.ID).Count == 0) { %>
                        <li><a href="<%= Level2.LinkUrlMVC %>"><%= Level2.Detalle%></a></li>
                                <% } else { %>
                        <li><a class="parent" href="<%= (Level2.LinkUrlMVC.Trim() == "?" ? "/Home/MenuNavigation?id=" + Level2.ID.ToString() : Level2.LinkUrlMVC) %>"><span><%= Level2.Detalle %></span></a>
                            <div><ul>
                                    <% foreach (APSWeb.Models.MenuModel Level3 in APSWeb.Models.GeneralUtitilies.GetSubMenues(Model.Menu, Level2.ID)) { %>
                                <li><a href="<%= Level3.LinkUrlMVC %>"><%= Level3.Detalle%></a></li>
                                    <% } %>
                            </ul></div>
                        </li>
                                <% } %>
                            <% } %>
                        <% } %>
                    </ul></div>
                </li>
                    <% } %>
                <% } %>
            <% } %>
            </ul></div>
        <% } %>
        </li>
    <% } %>
    <li class="last"><a href="/"><span>LogOut</span></a></li>
    </ul>
</div>
<% } %>
=end

