<?php
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