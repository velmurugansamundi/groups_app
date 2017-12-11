$(function(){




    $(document).on("click", "#role_id", function(){
        $("#user_ids_").val("");
    });


    $(document).on("click", ".add_members_to_group", function(){
        var str = "";
        var role = $("#role_id").val();
        var users =  $( "#user_ids_ option:selected" )
        console.log(users)
        if (users.length != 0){
            users.each(function() {
                console.log("Muruga")
                str += $( this ).val() + "_"+ role;
                var user_role = $(".added_users[identifier='"+str+"']")
                if (user_role.length == 0){
                    console.log(user_role)
                    var element = $(".add_user_clone_section").clone();
                    element.removeClass("add_user_clone_section")
                    element.find("#group_user_info_data__user_id").val($( this ).val())
                    element.find("#group_user_info_data__role_id").val(role)
                    $(element).insertBefore( ".form_btn_section" );
                }
                str = ""
            });
        }else{
            alert("Please select a User to Add")
        }
    });

    $(document).on("click", ".save_group_btn", function(){
        var users =  $( "#user_ids_").val();
        if (users){
            var role = $("#role_id").val();
            if (role == ""){
                alert("Please select a role to add users")
                return false;
            }
        }
        $( ".user_selection:not(:checked)").each(function(){
            var role = $(this).closest(".user-panel_info").attr("user_role_info")
            console.log(role)

            var element = $('.added_users[identifier="'+role+'"]')
            if (element){
                console.log(element)
                element.find("#group_user_info_data__group_operation").val("REMOVE")
//                element.remove();
            }

        })
    });



});
