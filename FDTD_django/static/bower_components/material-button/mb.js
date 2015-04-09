Polymer({
    is: 'material-button',
    properties: {
        /**
         * Link to the new window location.
         *
         * @attribute link
         * @type string
         * @default '#'
         */
        link: {
            type: String,
            value: '#'
        },
        /**
         * If true, the button should be styled with a shadow.
         *
         * @attribute raised
         * @type boolean
         * @default false
         */
        raised: {
            type: Boolean
        }
    },
    listeners: {
        'click': 'handleClick'
    },
    handleClick: function() {
        window.location.href = this.link;
    }
});