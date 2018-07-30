<?php

if (!function_exists('arrange_submenu')) {
    function arrange_submenu($items) {
        $menu = [];
        // 获取一级菜单
        foreach ($items as $key => $item) {
            if ($item['pid'] === 0) {
                $menu[$item['id']] = $item;
            }
        }

        // 归纳二级菜单
        foreach ($items as $key => $item) {
            if ($item['pid'] === 0) {
                continue;
            } else {
                $menu[$item['pid']]['sub_menu'][] = $item;
            }
        }
        return $menu;
    }
}

if (!function_exists('get_emojis')) {
    /**
     * 前端Emoji表情插件
     * @param $font_size
     * @param $input_id
     * @return object
     */
    function get_emojis($font_size, $input_id)
    {
        $emojis = ['😉', '😊', '😋', '😎', '😁', '😂', '😃', '😄', '😅', '😆', '😍', '😘', '😗', '😙', '🙂', '😒', '😓', '🙁', '🤔', '🙄', '😏', '😣', '😥', '😛', '😝', '😩', '😤', '😭', '😨', '😱', '😰', '😵', '😷', '🤧', '😂', '😍', '😘', '😴', '🤤', '🙃', '😖', '😦', '💪', '✌', '', '👌', '', '👏', '🙏', '☕', '🍭', '💎', '🍺', '⚽', '💔', '🤝', '✊'];
        $icons = '';
        foreach ($emojis as $emoji) {
            $icons .= "<span class=\"emoji\"><span class=\"emoji-size\">{$emoji}</span></span>";
        }

        $style = ".emoji-size{font-size: {$font_size}px;cursor: pointer;}";
        $js = <<<js
jQuery(".emoji").click(function(){
    let input = jQuery("#{$input_id}");
    let content = input.val() + jQuery(this).children('.emoji-size').text();
    input.val(content);
});
js;
        return (object) ['icons' => $icons, 'js' => $js, 'style' => $style];
    }
}

if (!function_exists('get_route_titles')) {
    /**
     * 获取操作名与路由别名的映射
     * @return array
     */
    function get_route_titles()
    {
        return [
            // 栏目
            'category.store' => '创建栏目',
            'category.update' => '编辑栏目',
            'category.destroy' => '删除栏目',
            // 文章
            'article.store' => '创建文章',
            'article.update' => '编辑文章',
            'article.destroy' => '删除文章',
            // 回收站
            'article.recycle' => '回收站',
            'article.restore' => '还原',
            'article.delete' => '永久删除',
            // 评论
            'comment.review' => '审核评论',
            'comment.destroy' => '删除评论',
            // 用户
            'user.store' => '创建用户',
            'user.update' => '编辑用户',
            'user.destroy' => '删除用户',
            // 菜单
            'menu.store' => '创建菜单',
            'menu.update' => '编辑菜单',
            'menu.destroy' => '删除菜单',
            // 管理员
            'admins.store' => '创建管理员',
            'admins.update' => '编辑管理员',
            'admins.destroy' => '删除管理员',
            // 角色
            'role.store' => '创建角色',
            'role.update' => '编辑角色',
            'role.destroy' => '删除角色',
            'role.setMenu' => '设置角色菜单',
            'role.authorize' => '角色授权',
            // 权限
            'ability.store' => '创建权限',
            'ability.update' => '编辑权限',
            'ability.destroy' => '删除权限',
            // 其它
            'admin.updatePassword' => '修改密码',
            'admin.changeAvatar' => '修改头像',
            'admin.update' => '编辑个人信息',
        ];
    }
}